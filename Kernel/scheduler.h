#ifndef SCHEDULER_H
#define SCHEDULER_H

#include <cstdint>

uint64_t newThread(void (*function)(void));

#endif