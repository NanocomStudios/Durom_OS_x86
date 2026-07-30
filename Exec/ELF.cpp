#include "ELF.h"
#include "../StdLib/stdio.h"
#include "../Memory/Paging.h"
#include "../Memory/PMM.h"

extern "C"{
    void *memcpy(void *__restrict dest, const void *__restrict src, std::size_t n);
    void *memset(void *s, int c, std::size_t n);
}

void* loadELFFile(File* file){
    ELF_Header* elfHeader = new ELF_Header;

    file->read(elfHeader, sizeof(ELF_Header), 0);

    if(elfHeader->magic[0]!= 0x7f || elfHeader->magic[1]!= 'E' || elfHeader->magic[2]!= 'L' || elfHeader->magic[3]!= 'F'){
        printf("A valid ELF header not found!\n");
        return 0;
    }

    if(elfHeader->bitFormat != 2 || elfHeader->isa != ELF_ISA_x86_64){
        printf("Not a valid 64bit program!\n");
        return 0;
    }

    printf("Valid ELF 64bit file found\n");
    printf("Program Header Table Offset :- %x\n", elfHeader->programHeaderTableOffset);
    printf("%d Headers each size of %d bytes.\n", elfHeader->programHeaderEntryCount, elfHeader->programHeaderEntrySize);
    printf("Program Entry point :- %x\n", elfHeader->programEntryOffset);

    ELF_ProgramHeader* prgHeader = new ELF_ProgramHeader;

    if(file->read(prgHeader, elfHeader->programHeaderEntrySize, elfHeader->programHeaderTableOffset) != elfHeader->programHeaderEntrySize){
        return 0;
    }

    for(uint64_t i = 0; i < elfHeader->programHeaderEntryCount; i++){
        if(prgHeader->type == 1){
            printf("Header %d\n", i);
            if(prgHeader->flags && 1)printf(" Executable\n");
            if(prgHeader->flags && 2)printf(" Writable\n");
            if(prgHeader->flags && 3)printf(" Readable\n");

            printf(" V_ADDR :- 0x%x bytes\n", prgHeader->virtualAddress);
            printf(" FSize :- %d bytes\n", prgHeader->fileSize);
            printf(" MSize :- %d bytes\n", prgHeader->memorySize);
            printf(" Offset :- 0x%x bytes\n", prgHeader->offset);

            uint64_t startingPageOffset = prgHeader->virtualAddress % 0x1000;
            uint64_t pageCount = (startingPageOffset + prgHeader->memorySize) / 0x1000;

            if(((startingPageOffset + prgHeader->memorySize) % 0x1000) != 0){
                pageCount++;
            }

            for(; pageCount > 0; pageCount--){
                allocateToPageTable((prgHeader->virtualAddress - startingPageOffset) + (0x1000 * (pageCount - 1)), (uint64_t)page_alloc(), 0x3);
            }

            char* section = (char*)(prgHeader->virtualAddress);
            file->read(section, prgHeader->fileSize, prgHeader->offset);

            if(prgHeader->fileSize < prgHeader->memorySize){
                memset(section + prgHeader->fileSize, 0, prgHeader->memorySize - prgHeader->fileSize);
            }

            printf("Loaded Header %d\n", i);

        }

        if(file->read(prgHeader, elfHeader->programHeaderEntrySize, elfHeader->programHeaderTableOffset + ((i + 1) * elfHeader->programHeaderEntrySize)) != elfHeader->programHeaderEntrySize){
            return 0;
        }
    }

    delete prgHeader;
    delete elfHeader;

    return (void*)(elfHeader->programEntryOffset);

}
