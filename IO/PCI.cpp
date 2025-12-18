#include "io.h"
#include "../StdLib/malloc.h"
#include "PCI.h"
#include "../Graphics/VGA.h"

pciNode* pciNodeList;

unsigned short pciConfigReadWord(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset) {
    unsigned int address;
    unsigned int lbus  = (unsigned int)bus;
    unsigned int lslot = (unsigned int)slot;
    unsigned int lfunc = (unsigned int)func;
    unsigned short tmp = 0;
  
    // Create configuration address as per Figure 1
    address = (unsigned int)((lbus << 16) | (lslot << 11) |
              (lfunc << 8) | (offset & 0xFC) | ((unsigned int)0x80000000));
  
    // Write out the address
    outl(0xCF8, address);
    // Read in the data
    // (offset & 2) * 8) = 0 will choose the first word of the 32-bit register
    tmp = (unsigned short)((inl(0xCFC) >> ((offset & 2) * 8)) & 0xFFFF);
    return tmp;
}

unsigned int pciConfigReadDouble(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset) {
    unsigned int address;
    unsigned int lbus  = (unsigned int)bus;
    unsigned int lslot = (unsigned int)slot;
    unsigned int lfunc = (unsigned int)func;
    unsigned int tmp = 0;
  
    // Create configuration address as per Figure 1
    address = (unsigned int)((lbus << 16) | (lslot << 11) |
              (lfunc << 8) | (offset & 0xFC) | ((unsigned int)0x80000000));
  
    // Write out the address
    outl(0xCF8, address);
    // Read in the data
    // (offset & 2) * 8) = 0 will choose the first word of the 32-bit register
    tmp = inl(0xCFC);
    return tmp;
}

void pciInit(){

    pciNodeList = (pciNode*)malloc(sizeof(pciNode));

    pciNode* pciNodeTmp = pciNodeList;
    char isInit = 0;

    for(int bus = 0 ; bus < 256; bus++){
        for(int slot = 0; slot < 32; slot++){
            if((pciConfigReadWord(bus,slot,0,14) & 0x80) != 0){
                for(int func = 0; func < 8; func++){
                    unsigned short tmp = pciConfigReadWord(bus,slot,func,10);
                    if(tmp != 0xFFFF){
                        if(isInit == 0){
                            pciNodeTmp->bus = bus;
                            pciNodeTmp->slot = slot;
                            pciNodeTmp->func = func;
                            pciNodeTmp->classCode = (unsigned char)(tmp >> 8);
                            pciNodeTmp->subClass = (unsigned char)(tmp & (unsigned short)255);
                            pciNodeTmp->progIF = (unsigned char)(pciConfigReadWord(bus,slot,func,8) >> 8);
                            pciNodeTmp->deviceID = pciConfigReadWord(bus,slot,func,0);
                            pciNodeTmp->vendorID = pciConfigReadWord(bus,slot,func,2);
                            pciNodeTmp->next = 0;
                            isInit = 1;
                        }else{

                            pciNodeTmp->next = (pciNode*)malloc(sizeof(pciNode));
                            pciNodeTmp = pciNodeTmp->next;
                            pciNodeTmp->bus = bus;
                            pciNodeTmp->slot = slot;
                            pciNodeTmp->func = func;
                            pciNodeTmp->classCode = (unsigned char)(tmp >> 8);
                            pciNodeTmp->subClass = (unsigned char)(tmp & (unsigned short)255);
                            pciNodeTmp->progIF = (unsigned char)(pciConfigReadWord(bus,slot,func,8) >> 8);
                            pciNodeTmp->deviceID = pciConfigReadWord(bus,slot,func,0);
                            pciNodeTmp->vendorID = pciConfigReadWord(bus,slot,func,2);
                            pciNodeTmp->next = 0;
                        }
                }
                }
            }else{
                unsigned short tmp = pciConfigReadWord(bus,slot,0,10);
                if(tmp != 0xFFFF){
                    if(isInit == 0){
                            pciNodeTmp->bus = bus;
                            pciNodeTmp->slot = slot;
                            pciNodeTmp->func = 0;
                            pciNodeTmp->classCode = (unsigned char)(tmp >> 8);
                            pciNodeTmp->subClass = (unsigned char)(tmp & (unsigned short)255);
                            pciNodeTmp->progIF = (unsigned char)(pciConfigReadWord(bus,slot,0,8) >> 8);
                            pciNodeTmp->deviceID = pciConfigReadWord(bus,slot,0,0);
                            pciNodeTmp->vendorID = pciConfigReadWord(bus,slot,0,2);
                            pciNodeTmp->next = 0;
                            isInit = 1;
                        }else{
                            pciNodeTmp->next = (pciNode*)malloc(sizeof(pciNode));
                            pciNodeTmp = pciNodeTmp->next;
                            pciNodeTmp->bus = bus;
                            pciNodeTmp->slot = slot;
                            pciNodeTmp->func = 0;
                            pciNodeTmp->classCode = (unsigned char)(tmp >> 8);
                            pciNodeTmp->subClass = (unsigned char)(tmp & (unsigned short)255);
                            pciNodeTmp->progIF = (unsigned char)(pciConfigReadWord(bus,slot,0,8) >> 8);
                            pciNodeTmp->deviceID = pciConfigReadWord(bus,slot,0,0);
                            pciNodeTmp->vendorID = pciConfigReadWord(bus,slot,0,2);
                            pciNodeTmp->next = 0;
                        }
                }
            }
        }
    }
}

void printPciList(){
    pciNode* pciNodeTmp = pciNodeList;
    while(pciNodeTmp != 0){
        printHex(pciNodeTmp->classCode);
        print(' ');
        printHex(pciNodeTmp->subClass);
        print(' ');
        printHex(pciNodeTmp->progIF);
        print(" -> ");
        printHex(pciNodeTmp->vendorID);
        print(':');
        printHex(pciNodeTmp->deviceID);
        print('\n');
        pciNodeTmp = pciNodeTmp->next;
    }
}

short getClassCount(unsigned char classCode){
    pciNode* pciNodeTmp = pciNodeList;
    short count = 0;
    while(pciNodeTmp != 0){
        if(pciNodeTmp->classCode == classCode){
            count++;
        }
        pciNodeTmp = pciNodeTmp->next;
    }
    return count;
}

pciNode* getClassCategory(unsigned char classCode){
    pciNode* pciNodeTmp = pciNodeList;
    short count = getClassCount(classCode);
    
    if(count == 0){
        return 0;
    }
    
    pciNode* buffer = (pciNode*)malloc(sizeof(pciNode) * count);

    short i = 0;
    while((pciNodeTmp != 0) && (i < count)){
        if(pciNodeTmp->classCode == classCode){
            buffer[i].bus = pciNodeTmp->bus;
            buffer[i].slot = pciNodeTmp->slot;
            buffer[i].func = pciNodeTmp->func;
            buffer[i].classCode = pciNodeTmp->classCode;
            buffer[i].subClass = pciNodeTmp->subClass;
            buffer[i].progIF = pciNodeTmp->progIF;
            i++;
        }
        pciNodeTmp = pciNodeTmp->next;
    }
    return buffer;
}