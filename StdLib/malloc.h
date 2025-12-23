#ifndef MALLOC
#define MALLOC

#define HEAP 32768
#include <cstddef>

#define BLOCK_START 0
#define PREVBLOCK 8
#define NEXTBLOCK 16

#define META_BLOCK 16

#define BLOCK_SIZE 16
#define NEXT_BLOCK_PTR 8

#define MEM_START 24
#define HEAP_START (24 + META_BLOCK)

void mallocInit();
void* malloc(size_t blockSize);
void free(void* ptr);
int getFreeBlock(size_t size);
void printMemoryInfo();

#endif
