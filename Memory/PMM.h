#ifndef PMM_H
#define PMM_H

#define DEFAULT_HHDM_OFFSET 0xFFFF800000000000
#include <cstdint>

void pmm_init();
void* page_alloc();
void page_free(long page);

#endif // PMM_H