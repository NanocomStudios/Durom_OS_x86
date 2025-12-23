#ifndef ISR_H
#define ISR_H

#include <stdint.h>

typedef struct InterruptData
{
    uint64_t registers[14];
    uint64_t cr0;
    uint64_t cr2;
    uint64_t int_no;
    uint64_t err_code;
    uint64_t rsp, rflags, cs, rip;
}__attribute__((packed)) InterruptFrame;

extern "C"{ 

void exception_handler(InterruptData* intr);
void irq_handler(InterruptData* intr);

}

#endif