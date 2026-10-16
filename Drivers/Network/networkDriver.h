#ifndef NETWORK_DRIVER_H
#define NETWORK_DRIVER_H

#include "../driver.h"

#include "stdint.h"

#define NETWORK_STATUS_INTERFACE    0b00000001
#define NETWORK_STATUS_IP_ADDR      0b00000010
#define NETWORK_STATUS_AUTO_IP      0b00000100


class [[gnu::packed]] NetworkDriver : public Driver{
    public:
        uint64_t interfaceID;
        uint32_t ipAddress;
        uint8_t status;
        virtual void init() = 0;
        virtual uint64_t send(void* data, uint64_t length) = 0;
        virtual void interruptHandler() = 0;
        uint64_t devRead(void* buffer, uint64_t length){
            return 0;
        }
        uint64_t devWrite(void* buffer, uint64_t length){
            send((void*)buffer, length);
            return length;
        }
};

void networkDriverInit(Vector<Driver*> *drivers);

#endif