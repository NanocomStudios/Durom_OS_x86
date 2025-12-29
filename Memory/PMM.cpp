#include "PMM.h"
#include "../StdLib/Nmath.h"

#include <limine.h>
#include <cstdint>

uint64_t ramBase = 0;
uint64_t ramSize = 0;

uint64_t page_alloc_bitmap_end = 0;
uint64_t page_count = 0;

uint64_t* page_alloc_bitmap = nullptr;

__attribute__((used, section(".limine_requests")))
volatile limine_memmap_request memmap_request = {
    .id = LIMINE_MEMMAP_REQUEST_ID,
    .revision = 0,
    .response = nullptr
};

void pmm_init(){
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
    page_count = ceiling_div(ramSize, 0x1000);
    page_alloc_bitmap_end = ramBase + ceiling_div(ceiling_div(page_count, 8), 0x1000) * 0x1000;
    page_alloc_bitmap = (char*)(DEFAULT_HHDM_OFFSET + ramBase);

    for(uint64_t i = 0; i < ceiling_div(page_count, 8); i++){
        page_alloc_bitmap[i] = 0;
    }
}

void* page_alloc(){
    for(uint64_t i = 0; i < ceiling_div(page_count, 64); i++){
        if(page_alloc_bitmap[i] != (uint64_t)0xFFFFFFFFFFFFFFFF){
            for(int j = 0; j < 8; j++){
                if(((char*)page_alloc_bitmap[i])[j] != (char)0xFF){
                    for(int k = 0; k < 8; k++){
                        if((((char*)page_alloc_bitmap[i])[j] & (1 << k)) == 0){
                            ((char*)page_alloc_bitmap[i])[j] |= (1 << k);
                            uint64_t pageAddr = ramBase + ((i * 64 + j * 8 + k) * 0x1000);
                            return (void*)(pageAddr);
                        }
                    }
                }
            }
        }
    }
    return nullptr;
}

void page_free(long page){
    uint64_t bitmapIndex = ((page - ramBase) / 0x1000) / 64;
    uint64_t bitIndex = ((page - ramBase) / 0x1000) % 64;
    page_alloc_bitmap[bitmapIndex] &= ~(1 << bitIndex);
}
