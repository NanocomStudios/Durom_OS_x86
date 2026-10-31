#include "dataLinkLayer.h"
#include "operations.h"

#include "../Drivers/Network/networkDriver.h"
#include "../StdLib/stdio.h"
#include "../StdLib/malloc.h"
#include "../Kernel/system.h"

uint8_t BROADCAST_MAC[6] = {0xff,0xff,0xff,0xff,0xff,0xff};
uint8_t EMPTY_MAC[6] = {0};

extern "C"{
    void *memcpy(void *__restrict dest, const void *__restrict src, std::size_t n);
    void *memset(void *s, int c, std::size_t n);
    int memcmp(const void *s1, const void *s2, std::size_t n);
}

void decodeEthernetPacket(void* buffer, uint64_t length, NetworkDriver* interface){
    
    if(length < sizeof(Ethernet)) return;

    Ethernet* eth = (Ethernet*)buffer;

    uint8_t broadcast_mac[6] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

    if((memcmp(eth->destinationMac, broadcast_mac, MAC_SIZE) != 0) && (memcmp(eth->destinationMac, interface->MAC_ADDRESS, MAC_SIZE) != 0)){
        return;
    }

    switch(eth->type){
        case ETHERNET_TYPE_ARP: // 08 06
            decodeARPPacket((void*)((uint64_t)buffer + sizeof(Ethernet)), length - sizeof(Ethernet), interface);
            break;
        case ETHERNET_TYPE_IPV4: // 08 00
            // decodeIPv4(buffer + sizeof(Ethernet), eth->sourceMac);
            break;
        default:
            break;
    }
}

void decodeARPPacket(void* buffer, uint64_t length, NetworkDriver* interface){
    
    if(length < sizeof(ARP))return;
    
    RedBlackTree<uint32_t, ARP_Entry*>* ARPTable = interface->ARPTable;

    ARP* arp = (ARP*)buffer;

    if((arp->hardwareType == ARP_HARDWARE_ETHERNET)){
        if(arp->protocol == ARP_PROTOCOL_IPV4){
            if(arp->operation == ARP_OPERATION_REQUEST){
                
                ARP_Entry* entry = ARPTable->search(*(uint32_t*)arp->senderIP);

                if(entry == 0){
                    entry = new ARP_Entry;
                    memcpy(entry->MAC_ADDRESS, arp->senderMAC, MAC_SIZE);
                    entry->status = ARP_STATUS_ACTIVE;
                    entry->expire = getTime() + 60;
                    ARPTable->insert(*(uint32_t*)arp->senderIP, entry);
                }else{
                    entry->status = ARP_STATUS_ACTIVE;
                    memcpy(entry->MAC_ADDRESS, arp->senderMAC, MAC_SIZE);
                    entry->expire = getTime() + 60;
                }
                arpReply(arp->senderMAC, arp->senderIP, interface);
            }else if(arp->operation == ARP_OPERATION_REPLY){

                ARP_Entry* entry = ARPTable->search(*(uint32_t*)arp->senderIP);

                if(entry != 0){
                    memcpy(entry->MAC_ADDRESS, arp->senderMAC, MAC_SIZE);
                    entry->status = ARP_STATUS_ACTIVE;
                    entry->expire = getTime() + 60;
                }

            }
        }
    }

}

void arpReply(uint8_t* senderMAC, uint8_t* senderIP, NetworkDriver* interface){
    uint64_t buffer_size = sizeof(Ethernet) + sizeof(ARP);
    
    if(buffer_size < ETHERNET_MIN_PACKET_SIZE){
        buffer_size += (ETHERNET_MIN_PACKET_SIZE - buffer_size);
    }
    void* buffer = malloc(buffer_size);

    memset(buffer, 0, buffer_size);

    ARP* arp = (ARP*)((uint64_t)buffer + sizeof(Ethernet));

    arp->hardwareType = ARP_HARDWARE_ETHERNET;
    arp->protocol = ARP_PROTOCOL_IPV4;

    arp->macAddressLength = 0x06;
    arp->IP_ADDRESSLength = 0x04;

    arp->operation = ARP_OPERATION_REPLY;

    memcpy(arp->senderMAC, interface->MAC_ADDRESS , MAC_SIZE);
    memcpy(arp->senderIP, interface->IP_ADDRESS , IP_SIZE);

    memcpy(arp->targetMAC, senderMAC, MAC_SIZE);
    memcpy(arp->targetIP, senderIP, IP_SIZE);

    if(!addEthernetHeader(buffer,senderMAC, ETHERNET_TYPE_ARP, sizeof(ARP), interface)){
        free(buffer);
        return;
    }

    interface->send(buffer, buffer_size);
    free(buffer);
}

void requestARP(uint8_t* ipAddress, NetworkDriver* interface){
    uint64_t buffer_size = sizeof(Ethernet) + sizeof(ARP);
    
    if(buffer_size < ETHERNET_MIN_PACKET_SIZE){
        buffer_size += (ETHERNET_MIN_PACKET_SIZE - buffer_size);
    }
    void* buffer = malloc(buffer_size);

    memset(buffer, 0, buffer_size);

    ARP* arp = (ARP*)((uint64_t)buffer + sizeof(Ethernet));

    arp->hardwareType = ARP_HARDWARE_ETHERNET;
    arp->protocol = ARP_PROTOCOL_IPV4;

    arp->macAddressLength = 0x06;
    arp->IP_ADDRESSLength = 0x04;

    arp->operation = ARP_OPERATION_REQUEST;

    memcpy(arp->senderMAC, interface->MAC_ADDRESS , MAC_SIZE);
    memcpy(arp->senderIP, interface->IP_ADDRESS , IP_SIZE);

    memset(arp->targetMAC, 0, MAC_SIZE);
    memcpy(arp->targetIP, ipAddress, IP_SIZE);

    ARP_Entry* entry = (interface->ARPTable)->search(*(uint32_t*)arp->senderIP);
    if(entry == 0){
        entry = new ARP_Entry;
        memcpy(entry->MAC_ADDRESS, EMPTY_MAC, MAC_SIZE);
        entry->status = ARP_STATUS_WAITING;
        entry->expire = getTime() + 300;
        interface->ARPTable->insert(*(uint32_t*)ipAddress, entry);
    }else{
        entry->status = ARP_STATUS_WAITING;
        entry->expire = getTime() + 300;
    }

    if(!addEthernetHeader(buffer,BROADCAST_MAC, ETHERNET_TYPE_ARP, sizeof(ARP), interface)){
        free(buffer);
        return;
    }

    interface->send(buffer, buffer_size);
    free(buffer);
}

int addEthernetHeader(void* buffer, uint8_t* destinationMAC, uint16_t type, uint16_t length, NetworkDriver* interface){
    Ethernet* eth = (Ethernet*)buffer;
    memcpy(eth->destinationMac, destinationMAC, MAC_SIZE);
    memcpy(eth->sourceMac, interface->MAC_ADDRESS , MAC_SIZE);
    
    eth->type = type;

    return 1;
}