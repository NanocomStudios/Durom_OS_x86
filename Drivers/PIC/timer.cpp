#include "timer.h"
#include "PIC.h"

#include "../../IO/io.h"

#include <cstdint>

void setTimer(uint32_t frequency, uint8_t timer, uint8_t operatingMode, uint8_t bcd){
    uint32_t div;
    
    if(frequency < 1)return;

    div = 1193180 / frequency;

    if(div > 65535) div = 0;

    uint8_t mode;

    mode = (uint8_t)(0 | (timer << 6) | (3 << 4) | (operatingMode << 1) | bcd);

    outb(0x43, mode);
    outb(0x40 + timer, (uint8_t) (div) );
 	outb(0x40 + timer, (uint8_t) (div >> 8));

}