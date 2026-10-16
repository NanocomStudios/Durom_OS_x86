#include "network.h"
#include "dataLinkLayer.h"
#include "operations.h"

#include "../StdLib/queue.h"
#include "../StdLib/rb_tree.h"
#include "../StdLib/stdio.h"
#include "../StdLib/malloc.h"
#include "../Kernel/scheduler.h"
#include "../Kernel/system.h"

Queue<NetworkPacket*>* packetQueue = 0;

void initNetworkStack(){
    packetQueue = new Queue<NetworkPacket*>;
    newThread(networkStackThread);
}

void pushToPacketQueue(NetworkPacket* packet){
    packetQueue->enqueue(packet);
}

void networkStackThread(){
    while(1){
        if(packetQueue->isEmpty()){
            asm("hlt");
        }else{
            NetworkPacket* packet = packetQueue->dequeue();
            
            

            free(packet->data);
            delete packet;
        }

    }
}