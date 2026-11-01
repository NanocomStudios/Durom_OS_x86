#ifndef DATALINKLAYER_H
#define DATALINKLAYER_H

#include <stdint.h>
#include "../Drivers/Network/networkDriver.h"

#define ETHERNET_TYPE_ARP   0x0608
#define ETHERNET_TYPE_IPV4  0x0008

#define ETHERNET_MIN_PACKET_SIZE 60

#define ETHERNET_MIN_PACKET_SIZE 60

#define ARP_HARDWARE_ETHERNET   0x0100  // 00 01

#define ARP_PROTOCOL_IPV4       0x0008  // 80 00

#define ARP_OPERATION_REQUEST   0x0100  // 00 01
#define ARP_OPERATION_REPLY     0x0200  // 00 02

#define IP_SIZE 4
#define MAC_SIZE 6

struct [[gnu::packed]] Ethernet{
    uint8_t destinationMac[6];
    uint8_t sourceMac[6];
    uint16_t type;
};

struct [[gnu::packed]] ARP{
    uint16_t hardwareType;
    uint16_t protocol;
    uint8_t macAddressLength;
    uint8_t IP_ADDRESSLength;
    uint16_t operation;
    uint8_t senderMAC[6];
    uint8_t senderIP[4];
    uint8_t targetMAC[6];
    uint8_t targetIP[4];
};

void decodeEthernetPacket(void* buffer, uint64_t length, NetworkDriver* interface);
void decodeARPPacket(void* buffer, uint64_t length, NetworkDriver* interface);
void arpReply(uint8_t* senderMAC, uint8_t* senderIP, NetworkDriver* interface);
void requestARP(uint8_t* ipAddress, NetworkDriver* interface);
int addEthernetHeader(void* buffer, uint8_t* destinationMAC, uint16_t type, NetworkDriver* interface);

#endif