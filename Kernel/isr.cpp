#include "isr.h"
#include "../Graphics/VGA.h"

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
        print("IRQ ");
        printInt(intr->int_no);
        print("!\n");
        return;
    }
}