#include "malloc.h"
#include "../Memory/paging.h"
#include "../Memory/PMM.h"
#include "../Graphics/VGA.h"
#include "../StdLib/Nmath.h"

#include "../StdLib/stdio.h"


#include <limine.h>
#include <cstddef>
#include <cstdint>


unsigned long heapBase = 0;
unsigned long heapSize = 0;

uint64_t allocatedSize = 0;

HeapMetaBlock* heapHeadBlock = 0;

void mallocInit(uint64_t baseAddress, uint64_t size){
        
        allocateToPageTable(baseAddress, (uint64_t)page_alloc(), 0x3);

        heapBase = baseAddress; // Start the heap at the given base address
        allocatedSize = 0x1000;
        heapSize = size; // Set the heap size to the given size

        heapHeadBlock = (HeapMetaBlock*)baseAddress;
        heapHeadBlock->size = 0;
        heapHeadBlock->prevBlock = 0;
        heapHeadBlock->nextBlock = 0;

}

void printMemoryInfo(){
        printf("Kernel Heap Base : %x\n", heapBase);
        printf("Kernel Heap Length : %x (%d)\n",heapSize,heapSize);
        printf("Kernel Heap Allocated : %x (%d)\n",allocatedSize,allocatedSize);
}

void* malloc(uint64_t size){
        if(((size + sizeof(HeapMetaBlock)) > heapSize) || (size < 0)){
                return 0;
        }

        HeapMetaBlock* currentBlock = heapHeadBlock;
        
        while(currentBlock->nextBlock != 0){
                
                if((((uint64_t)(currentBlock->nextBlock)) - (((uint64_t)currentBlock) + currentBlock->size + sizeof(HeapMetaBlock))) >= size + sizeof(HeapMetaBlock)){
                        HeapMetaBlock* newBlock = (HeapMetaBlock*)(((uint64_t)(currentBlock->data)) + currentBlock->size);

                        newBlock->prevBlock = currentBlock;
                        (currentBlock->nextBlock)->prevBlock = newBlock;
                        newBlock->nextBlock = currentBlock->nextBlock;
                        currentBlock->nextBlock = newBlock;
                        newBlock->size = size;

                        return (void*)(newBlock->data);
                }
                currentBlock = currentBlock->nextBlock;
        }
        
        uint64_t usedMemory = (((uint64_t)currentBlock->data) + currentBlock->size) - ((uint64_t)heapHeadBlock);
        uint64_t requiredMemory = usedMemory + size + sizeof(HeapMetaBlock);

        if(requiredMemory > (heapSize - allocatedSize)){
                return 0;
        }
        

        while(allocatedSize <= requiredMemory){
                allocateToPageTable(heapBase + allocatedSize, (uint64_t)page_alloc(), 0x3);
                allocatedSize += 0x1000;
        }

        HeapMetaBlock* newBlock = (HeapMetaBlock*)(((uint64_t)(currentBlock->data)) + currentBlock->size);

        newBlock->prevBlock = currentBlock;
        newBlock->nextBlock = currentBlock->nextBlock;
        currentBlock->nextBlock = newBlock;
        newBlock->size = size;

        return (void*)(newBlock->data);
}

void free(void* ptr){
        
        HeapMetaBlock* currentBlock = (HeapMetaBlock*)(((uint64_t)ptr) - sizeof(HeapMetaBlock));

        if(currentBlock->nextBlock != 0){
                (currentBlock->nextBlock)->prevBlock = currentBlock->prevBlock;
        }

        (currentBlock->prevBlock)->nextBlock = currentBlock->nextBlock;
}