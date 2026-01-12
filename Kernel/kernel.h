#ifndef KERNEL_H
#define KERNEL_H

#include <cstdint>

enum ThreadState {NEW, READY, RUNNING, BLOCKED, TERMINATED};

struct ThreadInformationBlock{
    uint64_t tid;
    uint64_t rsp;
    uint64_t stack_1, stack_2, stack_3, stack_4;
    ThreadState state;
};

void stackTest(int a);

void init_kernel();

#endif