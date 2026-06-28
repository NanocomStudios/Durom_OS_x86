#ifndef MALLOC
#define MALLOC

#include <cstddef>
#include <cstdint>

struct HeapMetaBlock{
    uint64_t size;
    HeapMetaBlock* nextBlock;
    HeapMetaBlock* prevBlock;
    char data[];
};

void mallocInit(uint64_t baseAddress, uint64_t size);
void* malloc(uint64_t size);
void free(void* ptr);
void printMemoryInfo();

#endif
