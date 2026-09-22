#include "DataLink.h"
#include "Operations.h"

void decodeEthernetPacket(void* buffer){
    
    Ethernet* eth = (Ethernet*)buffer;

    switch(*(uint16_t*)(eth->type)){
        case 0x608: // 08 06
            // decodeARPPacket(buffer + sizeof(Ethernet));
            break;
        case 0x8: // 08 00
            // decodeIPv4(buffer + sizeof(Ethernet), eth->sourceMac);
            break;
        default:
            break;
    }
}