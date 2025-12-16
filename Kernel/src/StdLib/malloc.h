#ifndef MALLOC
#define MALLOC

#define HEAP 32768

#define BLOCK_START 0
#define PREVBLOCK 4
#define NEXTBLOCK 8

#define META_BLOCK 8

#define BLOCK_SIZE 8
#define NEXT_BLOCK_PTR 4

#define MEM_START 12
#define HEAP_START (12 + META_BLOCK)

void mallocInit();
void* malloc(int blockSize);
void free(void* ptr);
int getFreeBlock(int size);

#endif
