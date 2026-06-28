#ifndef MALLOC
#define MALLOC

#define HEAP 32768
#include <cstddef>
#include <cstdint>

#define BLOCK_START 0
#define PREVBLOCK 8
#define NEXTBLOCK 16

#define META_BLOCK 16

#define BLOCK_SIZE 16
#define NEXT_BLOCK_PTR 8

#define MEM_START 24
#define HEAP_START (24 + META_BLOCK)

struct HeapMetaBlock{
    uint64_t size;
    HeapMetaBlock* nextBlock;
    HeapMetaBlock* prevBlock;
    char data[];
};

void mallocInit(uint64_t baseAddress, uint64_t size);
void* malloc(uint64_t size);
void free(void* ptr);
void* getFreeBlock(uint64_t size);
void printMemoryInfo();

#endif
