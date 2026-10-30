#ifndef NETWORKLAYER_H
#define NETWORKLAYER_H

#define VERSION_IHL 0x45
#define TIME_TO_LIVE 128;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;

typedef struct IPv4{
    uint8_t version_IHL;
    uint8_t DSCP_ECN;
    uint8_t length[2];
    uint8_t id[2];
    uint8_t flagsNfragmentOffset[2];
    uint8_t timeToLive;
    uint8_t protocol;
    uint16_t headerChecksum;
    uint8_t sourceIP[4];
    uint8_t destinationIP[4];
}IPv4;

void arpReply(uint8_t* senderMAC, uint8_t* senderIP);
void arpRequest(uint8_t* targetIP);
void decodeARPPacket(void* buffer);
void encodeIPv4(void* buffer, uint8_t protocol, uint8_t* targetIP, uint16_t length);
void decodeIPv4(void* buffer, uint8_t* senderMAC);
void encodeIPv4Common(void* buffer, uint8_t protocol, uint8_t* targetIP, uint8_t* targetMAC, uint16_t length);

#endif