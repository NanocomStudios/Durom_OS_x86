#include "ELF.h"
#include "../StdLib/stdio.h"

uint64_t loadELFFile(void* file){
    ELF_Header* elfHeader = (ELF_Header*)file;

    if(elfHeader->magic[0]!= 0x7f || elfHeader->magic[1]!= 'E' || elfHeader->magic[2]!= 'L' || elfHeader->magic[3]!= 'F'){
        printf("A valid ELF header not found!\n");
        return 0;
    }

    if(elfHeader->bitFormat != 2 || elfHeader->isa != ELF_ISA_x86_64){
        printf("Not a valid 64bit program!\n");
        return 0;
    }

    printf("Program with %d program entries.\n", elfHeader->programHeaderEntryCount);
    return 0;

}