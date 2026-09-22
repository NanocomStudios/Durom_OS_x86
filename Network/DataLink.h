#ifndef DATALINK_H
#define DATALINK_H

#include <stdint.h>

struct [[gnu::packed]] Ethernet{
    uint8_t destinationMac[6];
    uint8_t sourceMac[6];
    uint8_t type[2];
};

#endif