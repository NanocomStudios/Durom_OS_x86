#include "hdd.h"
#include "io.h"

void hddWait(){
    while((inb(0x1f7) & (unsigned char)128));
}