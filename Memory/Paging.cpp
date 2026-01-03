#include <cstdint>
#include "PMM.h"
#include "Paging.h"
#include "../Graphics/VGA.h"

uint64_t pageStructureRoot = 0;

void pagingInit(){
    asm volatile("movq %%cr3, %0" : "=r"(pageStructureRoot));
    pageStructureRoot = pageStructureRoot & (0xFFFFFFFFFFFFF000);
}

void allocateToPageTable(uint64_t virtualAddr, uint64_t physicalAddr, uint64_t flags){

    uint64_t* pageTable = (uint64_t*)(DEFAULT_HHDM_OFFSET + pageStructureRoot);

    for(int level = 4; level > 1; level--){

        uint64_t index = (virtualAddr >> (12 + (level -1) * 9)) & 0x1FF;

        if((pageTable[index] & 0x1) == 0){
            void* newPage = page_alloc();
            for(int i = 0; i < 512; i++){
                ((uint64_t*)((uint64_t)newPage + DEFAULT_HHDM_OFFSET))[i] = 0;
            }
            pageTable[index] = ((uint64_t)newPage) | 0x3; // Present + RW
        }
        pageTable = (uint64_t*)((pageTable[index] & 0xFFFFFFFFFFFFF000) + DEFAULT_HHDM_OFFSET);
        
    }
    uint64_t index = (virtualAddr >> 12) & 0x1FF;
    pageTable[index] = physicalAddr | flags | 0x1; // Present
}
