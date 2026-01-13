#include "isr.h"
#include "../Graphics/VGA.h"
#include "../Drivers/PIC/PIC.h"
#include "systemCalls.h"
#include "../StdLib/queue.h"
#include "../StdLib/rb_tree.h"
#include "kernel.h"
#include "../Memory/Paging.h"

extern Queue <uint64_t> readyQueue;
extern RedBlackTree <uint64_t, ThreadInformationBlock*> threadTable;

ThreadInformationBlock* currentThread;
ThreadInformationBlock* nextThread;

extern "C"{
    
    void exception_handler(InterruptData* intr) {
        print("Exception: ");

        switch (intr->int_no){
            case 0:
                print("Divide by zero.\n");
                break;
            case 3:
                print("Break Point.\n");
                return;
                break;
            case 14:
                print("Page Fault (");
                printHex(intr->cr2);
                print(")\n");
                printHex(intr->err_code);
                print('\n');
                break;
            default:
                print("Exception ");
                printInt(intr->int_no);
                print(" Code ");
                printHex(intr->err_code);
                print('\n');
        }
        asm("cli");
        while(1) asm("hlt");
        
    }
    
    void irq_handler(InterruptData* intr) {
        

        switch ((intr->int_no) - 64){
            case PIC_TIMER:

                nextThread = threadTable.search(readyQueue.dequeue());

                if(nextThread == nullptr){
                    PIC_sendEOI((intr->int_no) - 64);
                    return;
                }

                if(nextThread->state == TERMINATED){
                    // Free thread resources
                    nextThread = threadTable.search(readyQueue.dequeue());
                }else if(nextThread->state == READY){

                    if(currentThread != nullptr && currentThread->state == RUNNING){
                        currentThread->state = READY;
                        asm volatile(
                            "mov %%rsp, %0\n"
                            : "=r"(currentThread->rsp)
                        );
                        readyQueue.enqueue(currentThread->tid);
                    }

                    currentThread = nextThread;
                    currentThread->state = RUNNING;

                    asm volatile(
                        "mov %0, %%rsp\n"
                        :
                        : "r"(0x00007FFFFFFFF000 + 0x200)
                    );

                    allocateToPageTable(0x00007FFFFFFFE000, currentThread->stack_1, 0x03);
                    allocateToPageTable(0x00007FFFFFFFD000, currentThread->stack_2, 0x03);
                    allocateToPageTable(0x00007FFFFFFFC000, currentThread->stack_3, 0x03);
                    allocateToPageTable(0x00007FFFFFFFB000, currentThread->stack_4, 0x03);
                    
                    asm volatile(
                        "mov %%rsp, %0\n"
                        : "=r"(currentThread->rsp)
                    );
                }else if(nextThread->state == NEW){
                    currentThread = nextThread;
                    currentThread->state = RUNNING;

                    asm volatile(
                        "mov %0, %%rsp\n"
                        :
                        : "r"(0x00007FFFFFFFF000 + 0x200)
                    );

                    allocateToPageTable(0x00007FFFFFFFE000, currentThread->stack_1, 0x03);
                    allocateToPageTable(0x00007FFFFFFFD000, currentThread->stack_2, 0x03);
                    allocateToPageTable(0x00007FFFFFFFC000, currentThread->stack_3, 0x03);
                    allocateToPageTable(0x00007FFFFFFFB000, currentThread->stack_4, 0x03);

                    asm volatile(
                        "mov %%rsp, %0\n"
                        : "=r"(currentThread->rsp)
                    );

                    new_thread_wrapper(intr->int_no, currentThread->function);

                    currentThread->state = TERMINATED;
                    while(1) asm("hlt");

                }


                break;
            case PIC_KEYBOARD:

                break;

            default:
            if(((intr->int_no) - 64) < 16){
                    print("PIC ");
                    printInt((intr->int_no) - 64);
                    print("!\n");
                }else{
                    if(((intr->int_no) - 32) == 0x80){
                        systemCallHandler(intr);
                    }else{
                        print("Unknown IRQ ");
                        printInt((intr->int_no) - 64);
                        print("!\n");
                    }
                }
        }

        if(((intr->int_no) - 64) < 16){
            PIC_sendEOI((intr->int_no) - 64);
        }

        return;
    }
}

void new_thread_wrapper(uint64_t int_no, void (*function)(void)){
    PIC_sendEOI(int_no - 64);
    function();
}