#ifndef ISR_H
#define ISR_H

#include <stdint.h>

#define PIC_TIMER 0
#define PIC_KEYBOARD 1

typedef struct InterruptData
{
    uint64_t cr2;
    uint64_t cr0;
    uint64_t r15, r14, r13, r12, r11, r10, r9, r8;
    uint64_t rdi, rsi, rdx, rcx, rbx, rax;
    uint64_t int_no;
    uint64_t err_code;
    uint64_t rip, cs, rflags, rsp, ss;
}__attribute__((packed)) InterruptFrame;

extern "C"{ 

void exception_handler(InterruptData* intr);
void irq_handler(InterruptData* intr);
void new_thread_wrapper(uint64_t int_no, void (*function)(void));

}

#endif