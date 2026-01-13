#include "scheduler.h"
#include "kernel.h"
#include "../Memory/Paging.h"
#include "../Memory/PMM.h"
#include "../StdLib/queue.h"
#include "../StdLib/rb_tree.h"
#include "../StdLib/lock.h"
#include "../kernel/isr.h"


#include <cstdint>

Queue <uint64_t> readyQueue;
RedBlackTree <uint64_t, ThreadInformationBlock*> threadTable;

Spinlock lock;

uint64_t newThread(void (*function)(void)){
    lock.acquire();
    uint64_t newTID = 0;
    
    if (!threadTable.isEmpty()){
        newTID = (threadTable.getMax())->key_data + 1;
    }

    ThreadInformationBlock* tib = new ThreadInformationBlock;
    tib->tid = newTID;
    tib->stack_1 = (uint64_t)page_alloc();
    tib->stack_2 = (uint64_t)page_alloc();
    tib->stack_3 = (uint64_t)page_alloc();
    tib->stack_4 = (uint64_t)page_alloc();

    tib->rsp = 0x00007FFFFFFFE000;
    tib->state = NEW;

    tib->function = function;

    threadTable.insert(newTID, tib);
    lock.release();

    readyQueue.enqueue(newTID);
    return newTID;
}

