#include "../Kernel/isr.h"
#include "../Graphics/VGA.h"

#include <cstdint>
#include "systemCalls.h"

void systemCallHandler(InterruptData* intr){
    uint64_t syscall_number = intr->rax; // rax
    switch(syscall_number){
        // case 0:

        //     break;
        case 1:
            print((char)intr->rbx); // rbx
            break;
        default:
            print("Unknown System Call: ");
            printInt(syscall_number);
            print('\n');

            print("RAX: ");
            printHex(intr->rax);
            print('\n');
            break;
    }
}