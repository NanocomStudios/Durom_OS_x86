#include "hdd.h"
#include "io.h"
#include "VGA.h"

void hddWait(){
    while((inb(0x1f7) & (unsigned char)128));
}

void setDrive(){

}

void getDriveInfo(void* buffer){
    hddWait();
    outb(0x1f7,0xec);

    short i = 0;

    while((i < sizeof(DriveInfo)) && (inb(0x1f7) & (unsigned char)8)){
        unsigned short inp = inw(0x1f0);
        *(char*)buffer = (unsigned char)(inp >> 8);

        buffer = (char*)buffer + 1;

        *(char*)buffer = (unsigned char)(inp & 255);

        buffer = (char*)buffer + 1;

        i++;
    }
    while((inb(0x1f7) & (unsigned char)8)){
        inw(0x1f0);
    }

}

void readSectors(void* buffer, unsigned char sectorCount, unsigned int address){

    hddWait();

    outb(0x1f2, sectorCount);
    outb(0x1f3, (address  & (unsigned int)255));
    outb(0x1f4, ((address >> 8)  & (unsigned int)255));
    outb(0x1f5, ((address >> 16)  & (unsigned int)255));
    outb(0x1f6, 0xE0);
    outb(0x1f7, 0x20);

    int i = 0 ;

    while((i < (256)) && (inb(0x1f7) & (unsigned char)8)){
        unsigned short inp = inw(0x1f0);
        *((unsigned short*)buffer + i) = inp;
        i++;
    }
    while((inb(0x1f7) & (unsigned char)8)){
        inw(0x1f0);
    }
}

