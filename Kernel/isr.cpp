#include "isr.h"
#include "../Graphics/VGA.h"
#include "../Drivers/PIC/PIC.h"
#include "systemCalls.h"
#include "../StdLib/queue.h"
#include "../StdLib/rb_tree.h"
#include "kernel.h"
#include "../Memory/Paging.h"
#include "../Memory/PMM.h"

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
    uint64_t rsp;
    int i = 0;

    void irq_handler(InterruptData* intr) {
        

        switch ((intr->int_no) - 64){
            case PIC_TIMER:
                

                if(readyQueue.isEmpty()){
                    PIC_sendEOI((intr->int_no) - 64);
                    return;
                }
                
                nextThread = threadTable.search(readyQueue.dequeue());

            
                if(nextThread->state == TERMINATED){

                    print("Thread ");
                    printInt(nextThread->tid);
                    print(" Terminated.\n");

                    page_free(nextThread->stack_1);
                    page_free(nextThread->stack_2);
                    page_free(nextThread->stack_3);
                    page_free(nextThread->stack_4);
                    
                    threadTable.remove(nextThread->tid);

                    if(readyQueue.isEmpty()){
                        PIC_sendEOI((intr->int_no) - 64);
                        return;
                    }
                    nextThread = threadTable.search(readyQueue.dequeue());
                }
                
                if(nextThread->state == READY){
                    
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
                        "mov %0, %%rsp\n"
                        :
                        : "r"(currentThread->rsp)
                    );

                }else if(nextThread->state == NEW){

                    if(currentThread != nullptr && currentThread->state == RUNNING){
                        currentThread->state = READY;
                        asm volatile(
                            "mov %%rsp, %0\n"
                            : "=r"(currentThread->rsp)
                        );
                        readyQueue.enqueue(currentThread->tid);
                    }

                    asm volatile("mov %%rsp, %0" : "=r"(rsp));

                    for(i = 0; i < 30; i++){
                        *(((uint64_t*)(nextThread->stack_1 + DEFAULT_HHDM_OFFSET + 0x1000 - (8 * 30))) + i) = *(((uint64_t*)rsp) + i);
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

                    currentThread->rsp -= (8 * 30);

                    asm volatile(
                        "mov %0, %%rsp\n"
                        :
                        : "r"(currentThread->rsp)
                    );

                    ((InterruptData*)(currentThread->rsp + 32))->rip = (uint64_t)currentThread->function;

                }else{
                    print("Invalid Thread State!\n");
                    asm("cli");
                    while(1) asm("hlt");
                }


                break;
            case PIC_KEYBOARD:
                print("Keyboard IRQ!\n");
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