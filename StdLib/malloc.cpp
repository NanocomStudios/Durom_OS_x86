#include "malloc.h"
#include "../Graphics/VGA.h"

#include <limine.h>
#include <cstddef>

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

        ram = (char*)(ramBase + 0xFFFF800000000000);
        isInit = 0;
}

void printMemoryInfo(){
        print("RAM Base : ");
        printHex(ramBase);
        print("\nRAM Length : ");
        printInt(ramSize);
        print('\n');
}

void* malloc(size_t blockSize){
        if((blockSize > ramSize - HEAP_START) || (blockSize < 0)){
                return 0;
        }
        int size = (int) blockSize;
        int newBlock;

        if(isInit == 0){
                //Create the first block, Initialize the RAM
                *(long*)(ram + PREVBLOCK) = -1;
                *(long*)(ram + NEXTBLOCK) = -1;
		*(long*)(ram + BLOCK_START) = HEAP_START;
                newBlock = HEAP_START;
        }else{
                newBlock = getFreeBlock(size);
        }
        if (newBlock != -1){ // Can create a valid allocation
                *(long*)(ram + (newBlock - BLOCK_SIZE)) = size;
                *(long*)(ram + (newBlock - NEXT_BLOCK_PTR)) = *(long*)(ram + NEXTBLOCK);

                if(*(long*)(ram + PREVBLOCK) != -1){ // 
                        // Connect new block into the list
                        *(long*)(ram + (*(long*)(ram + PREVBLOCK) - NEXT_BLOCK_PTR)) = newBlock;
                }
                
                isInit = 1;
                return ram + newBlock;
        }
        return 0;
}

void free(void* ptr){
        if(((char*)ptr - ram) == *(long*)(ram + BLOCK_START)){ // Free the first block
                if(*(long*)(ram + *(long*)(ram + BLOCK_START) - NEXT_BLOCK_PTR) == -1){ // Only first block in the list
                        isInit = 0;
                }else{ // List has more blocks than the first block.
                        *(long*)(ram + BLOCK_START) = *(long*)(ram + *(long*)(ram + BLOCK_START) - NEXT_BLOCK_PTR);
                }
        }else{
                for(int i = *(long*)(ram + BLOCK_START); i < (ramSize - META_BLOCK);){
                        if(*(long*)(ram + i - NEXT_BLOCK_PTR) == ((char*)ptr - ram)){ // Free the pointer
                                *(long*)(ram + i - NEXT_BLOCK_PTR) = *(long*)((char*)ptr - NEXT_BLOCK_PTR);
                                break;
                        }else if((*(long*)(ram + i - NEXT_BLOCK_PTR) > ((char*)ptr - ram)) && (i < ((char*)ptr - ram))){ // Invalid pointer
                                break;
                        }else if(*(long*)(ram + i - NEXT_BLOCK_PTR) == -1){ // End of the list
                                break;
                        }else{
                                i = *(long*)(ram + (i - NEXT_BLOCK_PTR));
                        }
                }
        }
}

int getFreeBlock(size_t size){
        
                if((*(long*)(ram + BLOCK_START) - META_BLOCK - MEM_START) >= (size + META_BLOCK)){ 
                        // Has free space before the first block
                        *(long*)(ram + PREVBLOCK) = -1;
                        *(long*)(ram + NEXTBLOCK) = *(long*)(ram + BLOCK_START);
			*(long*)(ram + BLOCK_START) = *(long*)(ram + BLOCK_START) - META_BLOCK - size;
                        return *(long*)(ram + BLOCK_START);

                }

                for(int i = *(long*)(ram + BLOCK_START); i < (ramSize - META_BLOCK);){
                        if(*(long*)(ram + (i - NEXT_BLOCK_PTR)) == -1){
                                // Allocate at the end of the list
                                *(long*)(ram + PREVBLOCK) = i;
                                *(long*)(ram + NEXTBLOCK) = -1;
                                return i + *(long*)(ram + (i - BLOCK_SIZE)) + META_BLOCK;

                        }else if((*(long*)(ram + (i - NEXT_BLOCK_PTR)) - META_BLOCK - *(long*)(ram + (i - BLOCK_SIZE)) - i) >= (size + META_BLOCK)){
                                // Allocate in the middle
                                *(long*)(ram + PREVBLOCK) = i;
                                *(long*)(ram + NEXTBLOCK) = *(long*)(ram + (i - NEXT_BLOCK_PTR));

                                return i + *(long*)(ram + (i - BLOCK_SIZE)) + META_BLOCK;

                        }else{
                                i = *(long*)(ram + (i - NEXT_BLOCK_PTR));
                        }
                }
                return -1;                 
}