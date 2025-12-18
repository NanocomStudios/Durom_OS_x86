#include "malloc.h"
#include "../Graphics/VGA.h"

#include <limine.h>

char* ram;
char isInit;

extern char heap_start;

unsigned long ramBase = 0;
unsigned long ramSize = 0;

namespace {

__attribute__((used, section(".limine_requests")))
volatile limine_memmap_request memmap_request = {
    .id = LIMINE_MEMMAP_REQUEST_ID,
    .revision = 0,
    .response = nullptr
};

}


void mallocInit(){

        if (memmap_request.response == nullptr
                || memmap_request.response->entry_count < 1) {
                while(1);
        }

        for(int i = 0; i < memmap_request.response->entry_count; i++){
                if(memmap_request.response->entries[i]->type == 0){
                        ramBase = memmap_request.response->entries[i]->base;
                        ramSize = memmap_request.response->entries[i]->length;
                }
        }

        ram = &heap_start;
        isInit = 0;
}

void printMemoryInfo(){
        print("RAM Base : ");
        printHex(ramBase);
        print("\nRAM Length : ");
        printInt(ramSize);
        print('\n');
}

void* malloc(int blockSize){
        if((blockSize > HEAP - HEAP_START) || (blockSize < 0)){
                return 0;
        }
        int size = (int) blockSize;
        int newBlock;

        if(isInit == 0){
                //Create the first block, Initialize the RAM
                *(int*)(ram + PREVBLOCK) = -1;
                *(int*)(ram + NEXTBLOCK) = -1;
		*(int*)(ram + BLOCK_START) = HEAP_START;
                newBlock = HEAP_START;
        }else{
                newBlock = getFreeBlock(size);
        }
        if (newBlock != -1){ // Can create a valid allocation
                *(int*)(ram + (newBlock - BLOCK_SIZE)) = size;
                *(int*)(ram + (newBlock - NEXT_BLOCK_PTR)) = *(int*)(ram + NEXTBLOCK);

                if(*(int*)(ram + PREVBLOCK) != -1){ // 
                        // Connect new block into the list
                        *(int*)(ram + (*(int*)(ram + PREVBLOCK) - NEXT_BLOCK_PTR)) = newBlock;
                }
                
                isInit = 1;
                return ram + newBlock;
        }
        return 0;
}

void free(void* ptr){
        if(((char*)ptr - ram) == *(int*)(ram + BLOCK_START)){ // Free the first block
                if(*(int*)(ram + *(int*)(ram + BLOCK_START) - NEXT_BLOCK_PTR) == -1){ // Only first block in the list
                        isInit = 0;
                }else{ // List has more blocks than the first block.
                        *(int*)(ram + BLOCK_START) = *(int*)(ram + *(int*)(ram + BLOCK_START) - NEXT_BLOCK_PTR);
                }
        }else{
                for(int i = *(int*)(ram + BLOCK_START); i < (HEAP - META_BLOCK);){
                        if(*(int*)(ram + i - NEXT_BLOCK_PTR) == ((char*)ptr - ram)){ // Free the pointer
                                *(int*)(ram + i - NEXT_BLOCK_PTR) = *(int*)((char*)ptr - NEXT_BLOCK_PTR);
                                break;
                        }else if((*(int*)(ram + i - NEXT_BLOCK_PTR) > ((char*)ptr - ram)) && (i < ((char*)ptr - ram))){ // Invalid pointer
                                break;
                        }else if(*(int*)(ram + i - NEXT_BLOCK_PTR) == -1){ // End of the list
                                break;
                        }else{
                                i = *(int*)(ram + (i - NEXT_BLOCK_PTR));
                        }
                }
        }
}

int getFreeBlock(int size){
        
                if((*(int*)(ram + BLOCK_START) - META_BLOCK - MEM_START) >= (size + META_BLOCK)){ 
                        // Has free space before the first block
                        *(int*)(ram + PREVBLOCK) = -1;
                        *(int*)(ram + NEXTBLOCK) = *(int*)(ram + BLOCK_START);
			*(int*)(ram + BLOCK_START) = *(int*)(ram + BLOCK_START) - META_BLOCK - size;
                        return *(int*)(ram + BLOCK_START);

                }

                for(int i = *(int*)(ram + BLOCK_START); i < (HEAP - META_BLOCK);){
                        if(*(int*)(ram + (i - NEXT_BLOCK_PTR)) == -1){
                                // Allocate at the end of the list
                                *(int*)(ram + PREVBLOCK) = i;
                                *(int*)(ram + NEXTBLOCK) = -1;
                                return i + *(int*)(ram + (i - BLOCK_SIZE)) + META_BLOCK;

                        }else if((*(int*)(ram + (i - NEXT_BLOCK_PTR)) - META_BLOCK - *(int*)(ram + (i - BLOCK_SIZE)) - i) >= (size + META_BLOCK)){
                                // Allocate in the middle
                                *(int*)(ram + PREVBLOCK) = i;
                                *(int*)(ram + NEXTBLOCK) = *(int*)(ram + (i - NEXT_BLOCK_PTR));

                                return i + *(int*)(ram + (i - BLOCK_SIZE)) + META_BLOCK;

                        }else{
                                i = *(int*)(ram + (i - NEXT_BLOCK_PTR));
                        }
                }
                return -1;                 
}