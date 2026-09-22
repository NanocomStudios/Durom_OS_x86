#ifndef OPERATIONS_H
#define OPERATIONS_H

#include <stdint.h>

void changeEndien(void* array, int length);
uint16_t calculateChecksum(void* header, int length);

#endif