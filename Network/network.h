#ifndef NETWORK_H
#define NETWORK_H

#include <stdint.h>
#include "../Drivers/Network/networkDriver.h"

struct [[gnu::packed]] NetworkPacket{
    uint64_t interface;
    uint64_t length;
    void* data;
};

void initNetworkStack();
void pushToPacketQueue(NetworkPacket* packet);
void networkStackThread();

#endif