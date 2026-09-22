#ifndef INTEL_8254X_H
#define INTEL_8254X_H
#include "networkDriver.h"
#include "stdint.h"

#define I8254_REG_CTRL  0x0
#define I8254_REG_STATUS  0x8
#define I8254_REG_EECD  0x10
#define I8254_REG_EERD  0x14
#define I8254_REG_ICR 0xC0
#define I8254_REG_IMS 0xD0

#define I8254_REG_RCTL 0x100
#define I8254_REG_RDBAL 0x2800
#define I8254_REG_RDBAH 0x2804
#define I8254_REG_RDLEN 0x2808
#define I8254_REG_RDH 0x2810
#define I8254_REG_RDT 0x2818

#define I8254_REG_TCTL 0x400
#define I8254_REG_TDBAL 0x3800
#define I8254_REG_TDBAH 0x3804
#define I8254_REG_TDLEN 0x3808
#define I8254_REG_TDH 0x3810
#define I8254_REG_TDT 0x3818

#define E1000_REG_RAL0 0x5400
#define E1000_REG_RAH0 0x5404

#define I8254_CTRL_FD                0b00000000000000000000000000000001
#define I8254_CTRL_LRST              0b00000000000000000000000000001000
#define I8254_CTRL_ASDE              0b00000000000000000000000000100000
#define I8254_CTRL_SLU               0b00000000000000000000000001000000
#define I8254_CTRL_ILOS              0b00000000000000000000000010000000
#define I8254_CTRL_SPEED             0b00000000000000000000001100000000
#define I8254_CTRL_FRCSPD            0b00000000000000000000100000000000
#define I8254_CTRL_FRCDPLX           0b00000000000000000001000000000000
#define I8254_CTRL_SDP0_DATA         0b00000000000001000000000000000000
#define I8254_CTRL_SDP1_DATA         0b00000000000010000000000000000000
#define I8254_CTRL_ADVD3WUC          0b00000000000100000000000000000000
#define I8254_CTRL_EN_PHY_PWR_MGMT   0b00000000001000000000000000000000
#define I8254_CTRL_SDP0_IODIR        0b00000000010000000000000000000000
#define I8254_CTRL_SDP1_IODIR        0b00000000100000000000000000000000
#define I8254_CTRL_RST               0b00000100000000000000000000000000
#define I8254_CTRL_RFCE              0b00001000000000000000000000000000
#define I8254_CTRL_TFCE              0b00010000000000000000000000000000
#define I8254_CTRL_VME               0b01000000000000000000000000000000
#define I8254_CTRL_PHY_RST           0b10000000000000000000000000000000

#define I8254_STATUS_LU              0b00000000000000000000000000000010

#define I8254_EECD_PRESENT           0b00000000000000000000000100000000
 
#define I8254_EERD_START             0b00000000000000000000000000000001
#define I8254_EERD_DONE              0b00000000000000000000000000010000
 
#define E1000_TCTL_EN                0b00000000000000000000000000000010
#define E1000_TCTL_PSP               0b00000000000000000000000000001000
 
#define I8254_RCTL_EN                0b00000000000000000000000000000010
#define I8254_RCTL_LPE               0b00000000000000000000000000100000
#define I8254_RCTL_BAM               0b00000000000000001000000000000000
#define I8254_RCTL_BSIZE             0b00000000000000110000000000000000
#define I8254_RCTL_BSEX              0b00000010000000000000000000000000

#define E1000_IMS_RXT   0b00000000000000000000000010000000
#define E1000_IMS_RXO   0b00000000000000000000000001000000
#define E1000_IMS_LSC   0b00000000000000000000000000000100

#define TX_CMD_EOP  0b00000001
#define TX_CMD_IFCS 0b00000010
#define TX_CMD_IC   0b00000100
#define TX_CMD_RS   0b00001000
#define TX_CMD_RPS  0b00010000
#define TX_CMD_DEXT 0b00100000
#define TX_CMD_VLE  0b01000000
#define TX_CMD_IDE  0b10000000

#define RX_STATUS_DD    0b00000001
#define RX_STATUS_EOP   0b00000010
#define RX_STATUS_IXSM  0b00000100
#define RX_STATUS_RSV   0b00001000
#define RX_STATUS_VP    0b00010000
#define RX_STATUS_TCPCS 0b00100000
#define RX_STATUS_IPCS  0b01000000
#define RX_STATUS_PIF   0b10000000



#define NUM_OF_TX_DESCRIPTORS 256
#define SIZE_OF_TX_DESCRIPTOR_BUFFER 4096

#define NUM_OF_RX_DESCRIPTORS 256
#define SIZE_OF_RX_DESCRIPTOR_BUFFER 4096

struct [[gnu::packed]] Transmit_Descriptor{
    uint64_t buffer_address;
    uint16_t length;
    uint8_t CSO;
    uint8_t CMD;

    uint8_t STA : 4;
    uint8_t RSV : 4;

    uint8_t CSS;
    uint16_t special;
};

struct [[gnu::packed]] Receive_Descriptor{
    uint64_t buffer_address;
    uint16_t length;
    uint16_t checksum;
    uint8_t status;
    uint8_t error;
    uint16_t special;
};

class [[gnu::packed]] intel_8254x : public NetworkDriver{

    private:
        uint64_t io_addr;
        uint8_t mmio_mode;
        uint8_t MAC_ADDRESS[6];
        uint8_t rx_next = 0;
        Transmit_Descriptor* transmit_ring;
        Receive_Descriptor* receive_ring;


    public:
    void init();
    intel_8254x(uint64_t io_base_addr, uint8_t mmio);
    void write_register(unsigned short register, unsigned int value);
    unsigned int read_register(unsigned short register);
    uint64_t eeprom_read(uint8_t addr);
    void reset_nic();
    void setup_transmit_ring();
    void setup_receive_ring();
    void enable_interrupts();
    void send_data(void* data, uint32_t size, bool EOP);
    uint64_t send(void* data, uint64_t length);
    void interruptHandler();
    void receive_packets();

};

#endif