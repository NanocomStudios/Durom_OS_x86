#include "dataLinkLayer.h"
#include "operations.h"

#include "../Drivers/Network/networkDriver.h"
#include "../StdLib/stdio.h"
#include "../StdLib/malloc.h"
#include "../Kernel/system.h"

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
            printf("ARP Packet\n");
            decodeARPPacket(buffer + sizeof(Ethernet), length - sizeof(Ethernet), interface);
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
                    entry->expire = getTime() + 60;
                }

                printf("ARP_REQUEST\n");
                arpReply(arp->senderMAC, arp->senderIP, interface);
            }else if(arp->operation == ARP_OPERATION_REPLY){
                // if(isARPRequestd == 1){
                //     if(cmpArray(arp->senderIP, cacheIP, IP_SIZE) == 1){
                //         copyArray(arp->senderMAC, cacheMAC, MAC_SIZE);
                //         isARPRequestd = 0;
                //     }
                // }
            }
        }
    }

}

void arpReply(uint8_t* senderMAC, uint8_t* senderIP, NetworkDriver* interface){
    printf("Sending the Reply\n");
    uint64_t buffer_size = sizeof(Ethernet) + sizeof(ARP);
    void* buffer = malloc(buffer_size);
    ARP* arp = (ARP*)((uint64_t)buffer + sizeof(Ethernet));

    arp->hardwareType = ARP_HARDWARE_ETHERNET;
    arp->protocol = ARP_PROTOCOL_IPV4;

    arp->macAddressLength = 0x06;
    arp->IP_ADDRESSLength = 0x04;

    arp->operation = ARP_OPERATION_REPLY;
    printf("%d %d", interface->interfaceID, 5);
    arp->senderMAC[0] = interface->MAC_ADDRESS[0];
    printf("Mem copy begin\n");

    memcpy(arp->senderMAC, interface->MAC_ADDRESS , MAC_SIZE);
    printf("MAC Done\n");
    memcpy(arp->senderIP, interface->IP_ADDRESS , IP_SIZE);

    printf("Mem copy middle\n");

    memcpy(arp->targetMAC, senderMAC, MAC_SIZE);
    memcpy(arp->targetIP, senderIP, IP_SIZE);

    printf("Mem copy end\n");

    if(!addEthernetHeader(buffer,senderMAC, ETHERNET_TYPE_ARP, sizeof(ARP), interface)){
        free(buffer);
        return;
    }

    interface->send(buffer, buffer_size);
    printf("Sent\n");
    free(buffer);
}

int addEthernetHeader(void* buffer, uint8_t* destinationMAC, uint16_t type, uint16_t length, NetworkDriver* interface){
    Ethernet* eth = (Ethernet*)buffer;
    memcpy(eth->destinationMac, destinationMAC, MAC_SIZE);
    memcpy(eth->sourceMac, interface->MAC_ADDRESS , MAC_SIZE);
    
    eth->type = type;
    printf("Ethernet Header Added\n");

    return 1;
}