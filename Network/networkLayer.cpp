#include "networkLayer.h"
#include "operations.h"

void decodeARPPacket(void* buffer){
    
    // uint8_t senderMAC[6];
    // uint8_t senderIP[4];
    
    // ARP* arp = (ARP*)buffer;
    // if((arp->hardwareType[1] == 0x01)){
    //     if((arp->protocol[0] == 0x08) && (arp->protocol[1] == 0x00)){
    //         if((arp->operation[0] == 0x00) && (arp->operation[1] == 0x01)){
    //             copyArray(arp->senderMAC, senderMAC, MAC_SIZE);
    //             copyArray(arp->senderIP, senderIP, IP_SIZE);
    //             arpReply(senderMAC, senderIP);
    //         }else if((arp->operation[0] == 0x00) && (arp->operation[1] == 0x02)){
    //             if(isARPRequestd == 1){
    //                 if(cmpArray(arp->senderIP, cacheIP, IP_SIZE) == 1){
    //                     copyArray(arp->senderMAC, cacheMAC, MAC_SIZE);
    //                     isARPRequestd = 0;
    //                 }
    //             }
    //         }
    //     }
    // }

}