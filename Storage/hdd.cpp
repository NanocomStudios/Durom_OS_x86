#include "hdd.h"
#include "../IO/io.h"
#include "../IO/PCI.h"
#include "../StdLib/malloc.h"
#include "../Graphics/VGA.h"

short currentHddPort;
unsigned char masterSlaveState;
unsigned char lbaMode;

hddEntry* hddEntryList;
short hddCount;

hddEntry* getHddEntryList(){
    return hddEntryList;
}

short getHddCount(){
    return hddCount;
}

void hddWait(){
    while(((inb(currentHddPort + 7) & (unsigned char)BUSY) != 0));
}

char isReady(){
    return ((inb(currentHddPort + 7) & (unsigned char)READY));
}

char isError(){
    return ((inb(currentHddPort + 7) & (unsigned char)ERROR));
}

void setDrive(short port, char masterSlave, char lba){
    if((currentHddPort == port) && (masterSlaveState == masterSlave)){
        return;
    }
    currentHddPort = port;
    masterSlaveState = masterSlave;
    lbaMode = 1;

    unsigned char tmp = 0xA0;
    tmp = tmp | (masterSlaveState << MASTER_SLAVE_BIT);
    tmp = tmp | (lbaMode << LBA_MODE_BIT);
    outb(currentHddPort + 6, tmp);

    for(short i = 0; i < 16; i++){
        inb(currentHddPort + 7);
    }
    hddWait();
}

char getDriveInfo(void* buffer){
    
    outb(currentHddPort + 7,0xec);
    hddWait();
    if((readDriveStatus() & 1) == 1){
        return 0;
    }
    short i = 0;

    while((i < sizeof(DriveInfo)) && (inb(currentHddPort + 7) & (unsigned char)8)){
        unsigned short inp = inw(currentHddPort + 0);
        *(char*)buffer = (unsigned char)(inp >> 8);

        buffer = (char*)buffer + 1;

        *(char*)buffer = (unsigned char)(inp & 255);

        buffer = (char*)buffer + 1;

        i++;
    }
    while((inb(currentHddPort + 7) & (unsigned char)8)){
        inw(currentHddPort + 0);
    }
    return 1;

}

void setDriveAddress(unsigned int address){
    outb(currentHddPort + 3, (address  & (unsigned int)255));
    outb(currentHddPort + 4, ((address >> 8)  & (unsigned int)255));
    outb(currentHddPort + 5, ((address >> 16)  & (unsigned int)255));
}

void setSectorCount(unsigned char sectorCount){
    outb(currentHddPort + 2, sectorCount);
}

void writeCommand(unsigned char command){
    outb(currentHddPort + 7, command);
}

unsigned char readDriveStatus(){
    return inb(currentHddPort + 7);
}

int readSectors(void* buffer, unsigned char sectorCount, unsigned int address){

    while((inb(currentHddPort + 7) & (unsigned char)8)){
        inw(currentHddPort + 0);
    }

    hddWait();
    setSectorCount(sectorCount);
    setDriveAddress(address);
    
    unsigned char tmp = 0xA0;
    tmp = tmp | (masterSlaveState << MASTER_SLAVE_BIT);
    tmp = tmp | (lbaMode << LBA_MODE_BIT);

    tmp = tmp | ((address >> 24) & (unsigned int)15);

    outb(currentHddPort + 6, tmp);

    outb(currentHddPort + 7, 0x20);
    hddWait();
    int i = 0 ;

    while((i < (sectorCount * 256)) && (inb(currentHddPort + 7) & (unsigned char)8)){
        unsigned short inp = inw(currentHddPort + 0);
        *((unsigned short*)buffer + i) = inp;
        i++;
    }
    while((inb(currentHddPort + 7) & (unsigned char)8)){
        inw(currentHddPort + 0);
    }
    return i;
}

void hddInit(){
    pciNode* IDEPorts = getClassCategory(0x1);
    short IDEPortCount = getClassCount(0x1);
    
    hddCount=  IDEPortCount * 4;

    hddEntryList = (hddEntry*)malloc(sizeof(hddEntry) * hddCount);

    for(int i = 0; i < IDEPortCount; i++){
        if((IDEPorts[i].progIF & ((unsigned short)0x5)) == 0){ // 0101
            hddEntryList[i * 4].baseAddress = 0x1f0;
            hddEntryList[i * 4].masterSlave = MASTER;
            hddEntryList[(i * 4) + 1].baseAddress = 0x1f0;
            hddEntryList[(i * 4) + 1].masterSlave = SLAVE;

            hddEntryList[(i * 4) + 2].baseAddress = 0x170;
            hddEntryList[(i * 4) + 2].masterSlave = MASTER;
            hddEntryList[(i * 4) + 3].baseAddress = 0x170;
            hddEntryList[(i * 4) + 3].masterSlave = SLAVE;
        }else{
            printHex(pciConfigReadWord(IDEPorts[i].bus, IDEPorts[i].slot, IDEPorts[i].func, 0x10));
            print('\n');
            hddEntryList[i * 4].baseAddress = pciConfigReadWord(IDEPorts[i].bus, IDEPorts[i].slot, IDEPorts[i].func, 0x10) & 0xFFFC;
            hddEntryList[i * 4].masterSlave = MASTER;
            hddEntryList[(i * 4) + 1].baseAddress = hddEntryList[i * 4].baseAddress;
            hddEntryList[(i * 4) + 1].masterSlave = SLAVE;

            printHex(pciConfigReadWord(IDEPorts[i].bus, IDEPorts[i].slot, IDEPorts[i].func, 0x18));
            print('\n');
            hddEntryList[(i * 4) + 2].baseAddress = pciConfigReadWord(IDEPorts[i].bus, IDEPorts[i].slot, IDEPorts[i].func, 0x18) & 0xFFFC;
            hddEntryList[(i * 4) + 2].masterSlave = MASTER;
            hddEntryList[(i * 4) + 3].baseAddress = hddEntryList[(i * 4) + 2].baseAddress;
            hddEntryList[(i * 4) + 3].masterSlave = SLAVE;
        }
    }
    for(int i = 0; i < hddCount; i++){
        setDrive(hddEntryList[i].baseAddress, hddEntryList[i].masterSlave);
        setSectorCount(0);
        setDriveAddress(0);
        writeCommand(0xec);
        unsigned char readState = readDriveStatus();
        if((readState == 0) || ((readState & 1) != 0) || ((readState & 32) != 0)){
            hddEntryList[i].driveAvilable = 0;
        }else{
            hddEntryList[i].driveAvilable = 1;
        }
    }
}

void listHdd(){
    DriveInfo* dBuffer = (DriveInfo*)malloc(sizeof(DriveInfo));
    for(int i = 0; i < hddCount; i++){
        if(hddEntryList[i].driveAvilable == 1){
            setDrive(hddEntryList[i].baseAddress, hddEntryList[i].masterSlave);
            hddWait();
            if(getDriveInfo(dBuffer) == 0){
                break;
            }
            print(dBuffer->modelNumber);
            print('\n');
        }  
    }
    print("Done.\n");
    free(dBuffer);
}
