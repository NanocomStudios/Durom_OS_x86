#ifndef SYSTEM_CALLS_H
#define SYSTEM_CALLS_H

#include "../Kernel/isr.h"

void systemCallHandler(InterruptData* intr);

#endif