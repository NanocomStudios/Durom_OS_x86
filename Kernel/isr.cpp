#include "isr.h"
#include "../Graphics/VGA.h"
#include "../Drivers/PIC/PIC.h"
#include "systemCalls.h"
#include "../StdLib/queue.h"
#include "../StdLib/rb_tree.h"
#include "kernel.h"

extern Queue <uint64_t> readyQueue;
extern RedBlackTree <uint64_t, ThreadInformationBlock*> threadTable;

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

                

                // uint64_t newTID = readyQueue.dequeue();
                // ThreadInformationBlock* tcb = threadTable.search(newTID);



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