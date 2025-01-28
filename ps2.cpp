#include "ps2.h"
#include "io.h"

void ps2Wait(unsigned char mode){
    switch(mode){
        case READ:    
            while((inb(0x64) & mode) == 0);
            break;
        
        case WRITE:   
            while((inb(0x64) & mode) != 0);
            break;
    }
}

void ps2Write(unsigned char data){
    ps2Wait(WRITE);
    outb(0x64, 0xD4);
    ps2Wait(WRITE);
    outb(0x60, data);

    while(ps2Read() != 0xFA);
}

unsigned char ps2Read(){
    ps2Wait(READ);
    return inb(0x60);
}

