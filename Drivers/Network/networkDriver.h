#ifndef NETWORK_DRIVER_H
#define NETWORK_DRIVER_H

#include "../driver.h"
#include "../../StdLib/rb_tree.h"

#include "stdint.h"

#define NETWORK_STATUS_INTERFACE    0b00000001
#define NETWORK_STATUS_IP_ADDR      0b00000010
#define NETWORK_STATUS_AUTO_IP      0b00000100

#define ARP_STATUS_UNREACHABLE 0
#define ARP_STATUS_ACTIVE 1


struct [[gnu::packed]] ARP_Entry{
    uint8_t MAC_ADDRESS[6];
    uint8_t status;
    uint8_t rsvd;
    uint64_t expire;
};

class [[gnu::packed]] NetworkDriver : public Driver{
    public:
        uint64_t interfaceID;
        uint8_t IP_ADDRESS[4];
        uint8_t status;
        uint8_t MAC_ADDRESS[6];
        RedBlackTree<uint32_t, ARP_Entry*>* ARPTable;
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
Vector<NetworkDriver*> *getNetworkDriversList();

#endif