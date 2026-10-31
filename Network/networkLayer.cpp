#include "dataLinkLayer.h"
#include "networkLayer.h"
#include "operations.h"

#include "../Drivers/Network/networkDriver.h"

#include "../StdLib/stdio.h"
#include "../StdLib/malloc.h"
#include "../StdLib/rb_tree.h"
#include "../Kernel/system.h"

uint8_t BROADCAST_IP[4] = {0xff,0xff,0xff,0xff};

// RedBlackTree<uint16_t, RedBlackTree<uint16_t, void*>*> ipPacketBuffer;

uint16_t packetID = 0;

extern "C"{
    void *memcpy(void *__restrict dest, const void *__restrict src, std::size_t n);
    void *memset(void *s, int c, std::size_t n);
    int memcmp(const void *s1, const void *s2, std::size_t n);
}

int addIPv4Header(void* buffer, uint16_t length, uint8_t* destinationIP, uint16_t protocol, NetworkDriver* interface){
    printf("Add IPv4 Header\n");
    IPv4* ip = (IPv4*)((uint64_t)buffer + sizeof(Ethernet));
    length += sizeof(IPv4);

    ip->version = IPV4_VERSION;
    ip->IHL = IP_IHL;

    ip->DSCP = 0;
    ip->ECN = 0;

    ip->length = length;
    printf("Before Endian 1\n");
    changeEndien(&(ip->length), 2);
    printf("After Endian 1\n");

    ip->id = packetID++;
    printf("Before Endian 2\n");
    changeEndien(&(ip->id), 2);
    printf("After Endian 2\n");

    ip->df_flag = 1;
    ip->mf_flag = 0;

    ip->fragmentOffset_H = 0;
    ip->fragmentOffset_L = 0;

    ip->timeToLive = 64;

    ip->protocol = protocol;

    ip->headerChecksum = 0;

    memcpy(ip->sourceIP, interface->IP_ADDRESS, IP_SIZE);
    memcpy(ip->destinationIP, destinationIP, IP_SIZE);

    ip->headerChecksum = calculateChecksum(ip, sizeof(IPv4));

    return 1;

}

void decodeIPv4(void* buffer, uint64_t length, NetworkDriver* interface){
    IPv4* ip = (IPv4*)buffer;

    if(ip->version != 4) return;
    printf("IP Packet\n");
    if(calculateChecksum(ip, sizeof(IPv4)) != 0) return;
    printf("IP Packet with checksum\n");

    if(memcmp(ip->destinationIP, interface->IP_ADDRESS, IP_SIZE) && memcmp(ip->destinationIP, BROADCAST_IP, IP_SIZE)) return;
    
    if((ip->mf_flag == 1) || (ip->fragmentOffset_H != 0) || (ip->fragmentOffset_L != 0)){
        printf("Fragmented IP Packet\n");
        return;
    }

    changeEndien(&ip->length, 2);
    length = ip->length - sizeof(IPv4);

    switch(ip->protocol){
        case IP_PROTOCOL_ICMP:
            printf("ICMP Packet\n");
            decodeIcmp((void*)((uint64_t)buffer + sizeof(IPv4)), length, ip->sourceIP, interface);
            break;
        case IP_PROTOCOL_TCP:
            break;
        case IP_PROTOCOL_UDP:
            break;
        default:
            break;
    }
}

void decodeIcmp(void* buffer, uint16_t length, uint8_t* senderIP, NetworkDriver* interface){
    printf("length %d\n",length);
    length -= sizeof(ICMP);
    ICMP* icmp = (ICMP*)buffer;
    printf("Hi %p\n", icmp);
    switch(icmp->type){
        case ICMP_TYPE_ECHO_REQUEST:
            printf("Echo Request\n");
            // replyEchoRequest(buffer + sizeof(ICMP),senderIP, senderMAC, length);
            replyEchoRequest((void*)((uint64_t)buffer + sizeof(ICMP)), length, senderIP, interface);
            break;
        case ICMP_TYPE_ECHO_REPLY:
            break;
        default:
            break;

    }
}

void replyEchoRequest(void* echoReq, uint16_t length, uint8_t* destinationIP, NetworkDriver* interface){
    length -= sizeof(ECHO);
    uint64_t buffer_size = sizeof(ECHO) + sizeof(ICMP) + sizeof(IPv4) + sizeof(Ethernet) + length;
    void* buffer = malloc(buffer_size);
    ECHO* echoReply = (ECHO*)((uint64_t)buffer + sizeof(ICMP) + sizeof(IPv4) + sizeof(Ethernet));
    ICMP* icmp = (ICMP*)((uint64_t)buffer + sizeof(IPv4) + sizeof(Ethernet));

    ECHO* echoRequest = (ECHO*)echoReq;

    echoReply->id = echoRequest->id;
    echoReply->seq = echoRequest->seq;

    uint8_t* replyData = (uint8_t*)(((uint64_t)echoReply) + sizeof(ECHO));
    uint8_t* reqData = (uint8_t*)(((uint64_t)echoReq) + sizeof(ECHO));
    
    memcpy(replyData, reqData, length);

    icmp->type = ICMP_TYPE_ECHO_REPLY;
    icmp->code = ICMP_CODE_ECHO_REPLY;
    icmp->checkSum = 0;

    icmp->checkSum = calculateChecksum(icmp,sizeof(ECHO) + sizeof(ICMP) + length);
    printf("Before adding ip header\n");
    if(!addIPv4Header(buffer, length + sizeof(ECHO) + sizeof(ICMP), destinationIP, IP_PROTOCOL_ICMP, interface)){
        free(buffer);
        return;
    }
    printf("After adding IP header\n");

    ARP_Entry* entry = interface->ARPTable->search(*(uint32_t*)destinationIP);
    printf("After ARP Search\n");
    if(entry == 0){
        printf("No ARP Entry\n");
        free(buffer);
        return;
    }else{
        if(entry->status != ARP_STATUS_ACTIVE){ // note -- also make to check the expire
            printf("ARP Entry Inactive\n");
            free(buffer);
            return;
        }else{

            if(!addEthernetHeader(buffer, entry->MAC_ADDRESS , ETHERNET_TYPE_IPV4, interface)){
                free(buffer);
                return;
            }
            printf("Sending Reply\n");
            interface->send(buffer, buffer_size);
            free(buffer);

        }
    }

}