#ifndef TRANSPORTLAYER_H
#define TRANSPORTLAYER_H

#include <stdint.h>
#include "../Drivers/Network/networkDriver.h"

#define TCP_FLAG_URG 32
#define TCP_FLAG_ACK 16
#define TCP_FLAG_PSH 8
#define TCP_FLAG_RST 4
#define TCP_FLAG_SYN 2
#define TCP_FLAG_FIN 1

typedef struct UDP{
    uint16_t sourcePort;
    uint16_t destinationPort;
    uint16_t length;
    uint16_t checksum;
}UDP;

typedef struct TCP{
    uint16_t sourcePort;
    uint16_t destinationPort;
    unsigned int sequenceNumber;
    unsigned int acknowladgementNumber;
    uint8_t dataOffset;
    uint8_t flags;
    uint16_t window;
    uint16_t checksum;
    uint16_t urgentPointer;
}TCP;

typedef struct PSUDO_IP{
    unsigned int sourceIP;
    unsigned int destinationIP;
    uint8_t fixed;
    uint8_t protocol;
    uint16_t TCPSegmentLength;
}PSUDO_IP;

#endif