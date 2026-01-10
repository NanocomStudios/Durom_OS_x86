#ifndef PAGING_H
#define PAGING_H

#include <cstdint>

void pagingInit();
void allocateToPageTable(uint64_t virtualAddr, uint64_t physicalAddr, uint64_t flags);
uint64_t getPhysicalAddress(uint64_t virtualAddr);
#endif