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

    // InterruptData *frame = (InterruptData*)(tib->stack_1 + DEFAULT_HHDM_OFFSET);
    // frame->rip = (uint64_t)function;
    // frame->cs = 0x08;
    // frame->rflags = 0x202;
    // frame->rsp = 0x00007FFFFFFFF000; // Top of kernel stack
    // tib->rsp = frame->rsp - sizeof(InterruptData);

    threadTable.insert(newTID, tib);
    lock.release();

    readyQueue.enqueue(newTID);
    return newTID;
}

/*Scheduler on the isr
stack to the top buffer
swap the pages
return the stack
do all in the same function and use jmp and not call
*/
