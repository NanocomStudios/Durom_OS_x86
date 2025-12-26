#include "isr.h"
#include "../Graphics/VGA.h"
#include "../Drivers/PIC/PIC.h"

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
                break;
            default:
                print("Exception ");
                printInt(intr->int_no);
                print(" Code ");
                printInt(intr->err_code);
                print('\n');
        }
        asm("cli");
        while(1) asm("hlt");
        
    }
    
    void irq_handler(InterruptData* intr) {
        

        switch ((intr->int_no) - 64){
            case PIC_TIMER:

            break;
            case PIC_KEYBOARD:
                
                break;
            default:
            if(((intr->int_no) - 64) < 16){
                    print("PIC ");
                    printInt((intr->int_no) - 64);
                }else{
                    print("IRQ ");
                    printInt((intr->int_no) - 32);
                }
                print("!\n");
        }

        if(((intr->int_no) - 64) < 16){
            PIC_sendEOI((intr->int_no) - 64);
        }

        return;
    }
}