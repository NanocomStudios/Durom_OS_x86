#ifndef NETWORKLAYER_H
#define NETWORKLAYER_H

#include <stdint.h>
#include "../Drivers/Network/networkDriver.h"

#define IPV4_VERSION 4
#define IP_IHL 0x5
#define TIME_TO_LIVE 128

#define IP_SIZE 4

#define IP_PROTOCOL_ICMP 1
#define IP_PROTOCOL_TCP 6
#define IP_PROTOCOL_UDP 17

/* ==========================================================================
 * ICMP TYPE MACROS
 * ========================================================================== */
#define ICMP_TYPE_ECHO_REPLY              0
#define ICMP_TYPE_DEST_UNREACHABLE        3
#define ICMP_TYPE_REDIRECT                5
#define ICMP_TYPE_ECHO_REQUEST            8
#define ICMP_TYPE_ROUTER_ADV              9
#define ICMP_TYPE_ROUTER_SOLICIT         10
#define ICMP_TYPE_TIME_EXCEEDED          11
#define ICMP_TYPE_PARAMETER_PROBLEM      12
#define ICMP_TYPE_TIMESTAMP              13
#define ICMP_TYPE_TIMESTAMP_REPLY        14

/* ==========================================================================
 * ICMP CODE MACROS
 * ========================================================================== */

/* Type 0: Echo Reply Codes */
#define ICMP_CODE_ECHO_REPLY              0

/* Type 3: Destination Unreachable Codes */
#define ICMP_CODE_NET_UNREACHABLE         0  /* Destination network unreachable */
#define ICMP_CODE_HOST_UNREACHABLE        1  /* Destination host unreachable */
#define ICMP_CODE_PROTO_UNREACHABLE       2  /* Destination protocol unreachable */
#define ICMP_CODE_PORT_UNREACHABLE        3  /* Destination port unreachable */
#define ICMP_CODE_FRAG_NEEDED             4  /* Fragmentation is needed and DF flag set */
#define ICMP_CODE_SRC_ROUTE_FAILED        5  /* Source route failed */

/* Type 5: Redirect Message Codes */
#define ICMP_CODE_REDIRECT_NET            0  /* Redirect the datagram for the network */
#define ICMP_CODE_REDIRECT_HOST           1  /* Redirect datagram for the host */
#define ICMP_CODE_REDIRECT_TOS_NET        2  /* Redirect the datagram for the Type of Service and Network */
#define ICMP_CODE_REDIRECT_TOS_HOST       3  /* Redirect datagram for the Service and Host */

/* Type 8: Echo Request Codes */
#define ICMP_CODE_ECHO_REQUEST            0

/* Type 9: Router Advertisement Codes */
#define ICMP_CODE_ROUTER_ADV              0

/* Type 10: Router Solicitation Codes */
#define ICMP_CODE_ROUTER_SOLICIT          0

/* Type 11: Time Exceeded Codes */
#define ICMP_CODE_TTL_EXCEEDED            0  /* Time to live exceeded in transit */
#define ICMP_CODE_FRAG_REASM_EXCEEDED     1  /* Fragment reassembly time exceeded */

/* Type 12: Parameter Problem Codes */
#define ICMP_CODE_PTR_ERROR               0  /* The pointer indicates an error */
#define ICMP_CODE_MISSING_OPTION          1  /* Missing required option */
#define ICMP_CODE_BAD_LENGTH              2  /* Bad length */

/* Type 13: Timestamp Codes */
#define ICMP_CODE_TIMESTAMP               0

/* Type 14: Timestamp Reply Codes */
#define ICMP_CODE_TIMESTAMP_REPLY         0

struct [[gnu::packed]] IPv4{
    uint8_t IHL     : 4;
    uint8_t version : 4;
    uint8_t DSCP    : 6;
    uint8_t ECN     : 2;
    uint16_t length;
    uint16_t id;
    uint8_t fragmentOffset_H : 5;
    uint8_t rsvd_flag : 1;
    uint8_t df_flag : 1;
    uint8_t mf_flag : 1;
    uint8_t fragmentOffset_L;
    uint8_t timeToLive;
    uint8_t protocol;
    uint16_t headerChecksum;
    uint8_t sourceIP[4];
    uint8_t destinationIP[4];
};

struct [[gnu::packed]] ICMP{
    uint8_t type;
    uint8_t code;
    uint16_t checkSum;
};

struct [[gnu::packed]] ECHO{
    uint16_t id;
    uint16_t seq;
};

int addIPv4Header(void* buffer, uint16_t length, uint8_t* destinationIP, uint16_t protocol, NetworkDriver* interface);
void decodeIPv4(void* buffer, uint64_t length, NetworkDriver* interface);
void decodeIcmp(void* buffer, uint16_t length, uint8_t* senderIP, NetworkDriver* interface);
void replyEchoRequest(void* echoReq, uint16_t length, uint8_t* destinationIP, NetworkDriver* interface);

#endif