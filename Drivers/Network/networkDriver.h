#ifndef NETWORK_DRIVER_H
#define NETWORK_DRIVER_H

#include "../driver.h"

#include "stdint.h"

class [[gnu::packed]] NetworkDriver : public Driver{
    public:
        virtual void init() = 0;
        virtual uint64_t send(void* data, uint64_t length) = 0;
        virtual void interruptHandler() = 0;
};

NetworkDriver* networkDriverInit();

#endif