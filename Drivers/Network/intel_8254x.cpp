#include "../../StdLib/malloc.h"
#include "../../StdLib/stdio.h"
#include "../../IO/io.h"

#include "../../Memory/PMM.h"
#include "../../Memory/Paging.h"


#include "intel_8254x.h"

extern "C"{
    void *memcpy(void *__restrict dest, const void *__restrict src, std::size_t n);
}
uint8_t send_buff[] = {0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x20,0x03,0x25,0x61,0x03,0x40,0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};

void intel_8254x :: init(){
    reset_nic();
    setup_transmit_ring();
    setup_receive_ring();
    enable_interrupts();
    printf(" MAC ADDRESS :- %X:%X:%X:%X:%X:%X\n",MAC_ADDRESS[0],MAC_ADDRESS[1],MAC_ADDRESS[2],MAC_ADDRESS[3],MAC_ADDRESS[4],MAC_ADDRESS[5]);
}

void intel_8254x :: write_register(uint16_t reg, unsigned int value){
    if(mmio_mode){
        *(uint32_t *)(io_addr + reg + DEFAULT_HHDM_OFFSET) = value;
    }else{
        outl(io_addr + 0x00, reg);  // set the IOADDR window
        outl(io_addr + 0x04, value);  // write the value to the IOADDR window which will end up in the register in IOADDR
    }
    
}


unsigned int intel_8254x :: read_register(uint16_t reg){
    if(mmio_mode){
        return *(uint32_t *)(io_addr + reg + DEFAULT_HHDM_OFFSET);
    }else{
        outl(io_addr + 0x00, reg); // set the IOADDR window
        return inl(io_addr + 0x04); // read the value
    }
}

uint64_t intel_8254x :: eeprom_read(uint8_t addr){
    uint32_t tmp;
    uint16_t data;

    if((read_register(I8254_REG_EECD) & I8254_EECD_PRESENT) == 0){
        printf("EEPROM present bit is not set for i8254x\n");
        while(1);
    }

    tmp = ((uint32_t)addr & 0xff) << 8;
    tmp |= I8254_EERD_START;
    write_register(I8254_REG_EERD, tmp);

    /* Wait until the read is finished - then the DONE bit is cleared */
    while((read_register(I8254_REG_EERD) & I8254_EERD_DONE) == 0) __asm__ ("hlt");

    /* Obtain the data */
    data = (uint16_t)(read_register(I8254_REG_EERD) >> 16);

    /* Tell EEPROM to stop reading */
    tmp = read_register(I8254_REG_EERD);
    tmp &= ~(uint32_t)I8254_EERD_START;
    write_register(I8254_REG_EERD, tmp);
    return data;

}

intel_8254x :: intel_8254x(uint64_t io_base_addr, uint8_t mmio = 1){
    io_addr = io_base_addr;
    mmio_mode = mmio;

    if(mmio_mode){
        for(int i = 0; i < 32; i++){
            allocateToPageTable(io_addr + DEFAULT_HHDM_OFFSET + (i * 4096), io_addr + (i * 4096), 0b10 | 0b1000 | 0b10000); // Writable, Write through, Cache Disabled
        }
    }

}

void intel_8254x :: reset_nic(){
    uint32_t device_control = read_register(I8254_REG_CTRL);
    
    device_control |= I8254_CTRL_RST; // Set the reset bit
    write_register(I8254_REG_CTRL, device_control);
    
    while(read_register(I8254_REG_CTRL) & I8254_CTRL_RST) __asm__ ("hlt"); // wait for it to reset
    
    device_control = read_register(I8254_REG_CTRL);
    device_control |= I8254_CTRL_ASDE | I8254_CTRL_SLU; // Enable Auto Speed Detection.
    
    write_register(I8254_REG_CTRL, device_control);
    
    // Read the MAC address from the EEPROM
    uint16_t b0 = eeprom_read(0);
    uint16_t b1 = eeprom_read(1);
    uint16_t b2 = eeprom_read(2);
    
    MAC_ADDRESS[0] = b0 & 0xFF;
    MAC_ADDRESS[1] = b0 >> 8;
    MAC_ADDRESS[2] = b1 & 0xFF;
    MAC_ADDRESS[3] = b1 >> 8;
    MAC_ADDRESS[4] = b2 & 0xFF;
    MAC_ADDRESS[5] = b2 >> 8;
    
    // Write the MAC address to RAL/RAH 0.
    uint32_t writeL = ((uint32_t)b1 << 16) | b0;
    uint32_t writeH = b2;
    
    write_register(E1000_REG_RAL0, writeL);
    write_register(E1000_REG_RAH0, writeH);
}

void intel_8254x :: setup_transmit_ring(){
    size_t transmit_ring_size = NUM_OF_TX_DESCRIPTORS * 16;
    transmit_ring = (Transmit_Descriptor*)page_alloc(); // 256 * 16 = 4096 -> 1 page
    allocateToPageTable((uint64_t)transmit_ring + DEFAULT_HHDM_OFFSET, (uint64_t)transmit_ring, 0b10 | 0b1000 | 0b10000);
    
    for (int i = 0; i < NUM_OF_TX_DESCRIPTORS; i++){
        Transmit_Descriptor* descriptor = (Transmit_Descriptor*)((uint64_t)(transmit_ring + i) + DEFAULT_HHDM_OFFSET); // ring + i -> pointer arithmetics
        descriptor->buffer_address = (uint64_t)page_alloc();
        allocateToPageTable(descriptor->buffer_address + DEFAULT_HHDM_OFFSET, descriptor->buffer_address, 0b10 | 0b1000 | 0b10000);
    }
    
    write_register(I8254_REG_TDBAL, ((uint64_t)transmit_ring) & 0xFFFFFFFF);
    write_register(I8254_REG_TDBAH, ((uint64_t)transmit_ring) >> 32);
    write_register(I8254_REG_TDLEN, transmit_ring_size);
    write_register(I8254_REG_TDH, 0);
    write_register(I8254_REG_TDT, 0);
    
    // Set the Enable (EN) and Pad Short Packets (PSP) bits
    uint32_t tctl = E1000_TCTL_EN | E1000_TCTL_PSP;
    write_register(I8254_REG_TCTL, tctl);
}


void intel_8254x :: setup_receive_ring(){
    size_t receive_ring_size = NUM_OF_RX_DESCRIPTORS * 16; // you can substitute 16 with sizeof(receive_descriptor_t)
    receive_ring = (Receive_Descriptor*)page_alloc();
    allocateToPageTable((uint64_t)receive_ring + DEFAULT_HHDM_OFFSET, (uint64_t)receive_ring, 0b10 | 0b1000 | 0b10000);
    
    for (int i = 0; i < NUM_OF_RX_DESCRIPTORS; i++){
        Receive_Descriptor* descriptor = (Receive_Descriptor*)((uint64_t)(receive_ring + i) + DEFAULT_HHDM_OFFSET); // ring + i -> pointer arithmetics
        descriptor->buffer_address = (uint64_t)page_alloc();
        allocateToPageTable(descriptor->buffer_address + DEFAULT_HHDM_OFFSET, descriptor->buffer_address, 0b10 | 0b1000 | 0b10000);
    }
    
    write_register(I8254_REG_RDBAL, ((uint64_t)receive_ring) & 0xFFFFFFFF); // Base Address Low
    write_register(I8254_REG_RDBAH, ((uint64_t)receive_ring) >> 32); // Base Address High
    write_register(I8254_REG_RDLEN, receive_ring_size); // Ring Size
    write_register(I8254_REG_RDH, 0); // Set it to the first descriptor
    write_register(I8254_REG_RDT, NUM_OF_RX_DESCRIPTORS - 1); // Set it to the last descriptor
    
    // Set the Enable, Long Packet Reception, Broadcast Accept Mode and Size Extenstion bits
    // Also set the buffer size. This configuration (BSIZE = 0b11 and BSEX = 1) means 4096 (4kB) buffers
    uint32_t rctl = I8254_RCTL_EN | I8254_RCTL_LPE | I8254_RCTL_BAM | I8254_RCTL_BSEX | (0b11 << I8254_RCTL_BSIZE);
    write_register(I8254_REG_RCTL, rctl); 
}

void intel_8254x :: enable_interrupts(){
    uint32_t ims = E1000_IMS_RXT | E1000_IMS_RXO | E1000_IMS_LSC;
    write_register(I8254_REG_IMS, ims);
}

void intel_8254x :: send_data(void* data, uint32_t size, bool EOP){
    uint32_t tail = read_register(I8254_REG_TDT);
    Transmit_Descriptor* tx = (Transmit_Descriptor*)((uint64_t)(transmit_ring + tail) + DEFAULT_HHDM_OFFSET); // Get the descriptor the tail is pointing at (next available descriptor)

    memcpy((void*)(tx->buffer_address + DEFAULT_HHDM_OFFSET), data, size); // Copy the data to the previously allocated buffer

    tx->length = size; // Set the length of the descriptor

    if (EOP) tx->CMD |= TX_CMD_EOP | TX_CMD_IFCS; // If its the last one, set EOP
    tail = (tail + 1) % NUM_OF_TX_DESCRIPTORS;
    write_register(I8254_REG_TDT, tail); // Increment and write the tail
}

uint64_t intel_8254x :: send(void* data, uint64_t length){
    size_t sent = 0;
    // split the data into chunks and send them
    for (; sent < length;){
        int to_send = (length - sent < SIZE_OF_TX_DESCRIPTOR_BUFFER) ? (length - sent) : SIZE_OF_TX_DESCRIPTOR_BUFFER;
        send_data((void*)((uint64_t)data + sent), to_send, to_send == (length - sent));
        sent += to_send;
    }
    return sent;
}

void intel_8254x :: interruptHandler(){
    uint32_t cause = read_register(I8254_REG_ICR); // Cleared upon read

    if (cause & E1000_IMS_RXT) { // Packets received
        // printf("Packets\n");
        // receive_packets();  // Call the function responsible for receiving
                            // packets and sending them to the network stack
    }

    if (cause & E1000_IMS_LSC){ // link status change
        // Read the status register and check the LU bit to get the link status
        if (read_register(I8254_REG_STATUS) & I8254_STATUS_LU) {
            printf("Link change detected: Link up!\n");
        }else{
            printf("Link change detected: Link down!\n");
        }
    }
}