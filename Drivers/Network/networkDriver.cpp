#include "networkDriver.h"
#include "intel_8254x.h"

#include "../../IO/PCI.h"
#include "../../StdLib/stdio.h"
#include "../../Kernel/isr.h"
#include "../../Graphics/VGA.h"
#include "../../StdLib/malloc.h"

void networkDriverInit(Vector<Driver*> *drivers){
    pciNode* networkDeviceList = getClassCategory(0x02);
    uint64_t networkDeviceCount = getClassCount(0x02);
    if(networkDeviceCount == 0){
        printf("No Network Device Found!\n");
        free(networkDeviceList);
        return;
    }

    uint64_t networkDeviceIndex = 0;

    for(int i = 0; i < networkDeviceCount; i++){
        if(networkDeviceList[i].classCode != 0x02 || networkDeviceList[i].subClass != 0x00 || networkDeviceList[i].progIF != 0x00){
            continue;
        }
        pciHeader* header = getPciHeader(&networkDeviceList[i]);
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

                                driver->devMode = 1;

                                int nameLength = 3 + len(networkDeviceIndex) + 1;

                                driver->devName = (char*)malloc(nameLength);

                                driver->devName[0] = 'e';
                                driver->devName[1] = 't';
                                driver->devName[2] = 'h';
                                int devID = networkDeviceIndex;

                                for(long i = 0; i < nameLength - 1; i++){
                                    *((driver->devName) + 3 + i) = (devID % 10) + 0x30;
                                    devID = devID / 10;
                                }
                                driver->devName[nameLength - 1] = 0;

                                drivers->push(driver);
                                if(header->interruptLine != 255){
                                    printf(" Interrupt mapping :- IRQ %d to Pin %d\n",header->interruptLine, header->interruptPin);
                                    registerDriverInterrupt(driver, header->interruptLine);
                                }
                                networkDeviceIndex++;

                                //return driver;
                            }
                        }else{

                        }
                        // return 0;
                        break;
                    default:
                        printf("Unknown Intel Network Device Found!\n");
                        // return 0;
                        break;
                }
                break;
            case 0x10EC: //Realtek
                switch(header->deviceID){
                    case 0x8161:
                    case 0x8168:
                    case 0x8169:
                        printf("Realtek Network Adaptor Found!\n");
                        // return 0;
                        break;
                    default:
                        printf("Unknown Realtek Network Device Found!\n");
                        // return 0;
                        break;
                }
                break;
            default:
                printf("Unknown Network Device Found!\n");
                break;
        }
    }
    free(networkDeviceList);
}