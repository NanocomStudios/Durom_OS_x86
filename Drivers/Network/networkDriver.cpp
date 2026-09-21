#include "networkDriver.h"
#include "intel_8254x.h"

#include "../../IO/PCI.h"
#include "../../StdLib/stdio.h"
#include "../../Kernel/isr.h"

NetworkDriver* networkDriverInit(){
    pciNode* networkDevice = getPciNodeList(0x02, 0x00, 0x00);
    if(networkDevice == 0){
        printf("No Network Device Found!\n");
        return 0;
    }

    while(networkDevice != 0){
        pciHeader* header = getPciHeader(networkDevice);
        uint8_t mmio = 0;
        uint64_t addr = 0;
        NetworkDriver* driver = 0;
        switch(header->vendorID){
            case 0x8086: //Intel
                switch(header->deviceID){
                    case 0x100E:
                        printf("Intel PRO/1000 MT Desktop Adapter Found!\n");

                        mmio = (header->bar0 & 1) == 0;
                        addr = 0;

                        if(mmio){
                            addr = header->bar0 & 0xFFFFFFF0;
                            if(header->bar0 & 0x10){
                                addr += (header->bar1 << 32);
                            }

                            printf(" IO_ADDR :- %X, with MMIO :- %d\n", addr,mmio);
                            if(addr){
                                driver = new intel_8254x(addr, mmio);
                                driver->init();

                                if(header->interruptLine != 255){
                                    printf(" Interrupt mapping :- IRQ %d to Pin %d\n",header->interruptLine, header->interruptPin);
                                    registerDriverInterrupt(driver, header->interruptLine);
                                }

                                return driver;
                            }
                        }else{

                        }
                        return 0;
                        break;
                    default:
                        printf("Unknown Intel Network Device Found!\n");
                        return 0;
                        break;
                }
                break;
            case 0x10EC: //Realtek
                switch(header->deviceID){
                    case 0x8161:
                    case 0x8168:
                    case 0x8169:
                        printf("Realtek Network Adaptor Found!\n");
                        return 0;
                        break;
                    default:
                        printf("Unknown Realtek Network Device Found!\n");
                        return 0;
                        break;
                }
                break;
            default:
                printf("Unknown Network Device Found!\n");
                break;
        }
        networkDevice = networkDevice->next;
    }
    return 0;
}