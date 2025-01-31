#include "hdd.h"
#include "../IO/io.h"

short currentHddPort;
unsigned char masterSlaveState;
unsigned char lbaMode;


void hddWait(){
    while((inb(currentHddPort + 7) & (unsigned char)BUSY));
}

char isReady(){
    return ((inb(currentHddPort + 7) & (unsigned char)READY));
}

char isError(){
    return ((inb(currentHddPort + 7) & (unsigned char)ERROR));
}

void setDrive(short port, char masterSlave, char lba = 1){
    currentHddPort = port;
    masterSlaveState = masterSlave;
    lbaMode = lba;

    unsigned char tmp = 0xA0;
    tmp = tmp | (masterSlaveState << MASTER_SLAVE_BIT);
    tmp = tmp | (lbaMode << LBA_MODE_BIT);

    outb(currentHddPort + 6, tmp);

}

void getDriveInfo(void* buffer){
    hddWait();
    outb(currentHddPort + 7,0xec);

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

}

void readSectors(void* buffer, unsigned char sectorCount, unsigned int address){

    hddWait();

    outb(currentHddPort + 2, sectorCount);
    outb(currentHddPort + 3, (address  & (unsigned int)255));
    outb(currentHddPort + 4, ((address >> 8)  & (unsigned int)255));
    outb(currentHddPort + 5, ((address >> 16)  & (unsigned int)255));
    
    unsigned char tmp = 0xA0;
    tmp = tmp | (masterSlaveState << MASTER_SLAVE_BIT);
    tmp = tmp | (lbaMode << LBA_MODE_BIT);

    tmp = tmp | ((address >> 24) & (unsigned int)15);

    outb(currentHddPort + 6, tmp);

    outb(currentHddPort + 7, 0x20);

    int i = 0 ;

    while((i < (sectorCount * 256)) && (inb(currentHddPort + 7) & (unsigned char)8)){
        unsigned short inp = inw(currentHddPort + 0);
        *((unsigned short*)buffer + i) = inp;
        i++;
    }
    while((inb(currentHddPort + 7) & (unsigned char)8)){
        inw(currentHddPort + 0);
    }
}

