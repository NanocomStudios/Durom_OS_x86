#ifndef ELF_H
#define ELF_H

#include <cstdint>
#include "../FileSystem/fileSystem.h"

#define ELF_ISA_x86 0x03
#define ELF_ISA_x86_64 0x3E

#define ELF_HEADER_TYPE_RELOCATABLE 0x01
#define ELF_HEADER_TYPE_EXECUTABLE 0x02
#define ELF_HEADER_TYPE_SHARED 0x03
#define ELF_HEADER_TYPE_CORE 0x04

#define ELF_PROGRAM_HEADER_TYPE_NULL 0x00
#define ELF_PROGRAM_HEADER_TYPE_LOAD 0x01
#define ELF_PROGRAM_HEADER_TYPE_DYNAMIC 0x02
#define ELF_PROGRAM_HEADER_TYPE_INTERP 0x03
#define ELF_PROGRAM_HEADER_TYPE_NOTE 0x04

#define ELF_PROGRAM_HEADER_FLAG_EXECUTABLE 0x1
#define ELF_PROGRAM_HEADER_FLAG_WRITABLE 0x2
#define ELF_PROGRAM_HEADER_FLAG_READABLE 0x4


struct ELF_Header{
    char magic[4];
    uint8_t bitFormat;
    uint8_t endianness;
    uint8_t headerVersion;
    uint8_t OS_ABI;
    char padding1[8];
    uint16_t type;
    uint16_t isa;
    uint32_t ELFversion;
    uint64_t programEntryOffset;
    uint64_t programHeaderTableOffset;
    uint64_t sectionHeaderTableOffset;
    uint32_t flags;
    uint16_t headerSize;
    uint16_t programHeaderEntrySize;
    uint16_t programHeaderEntryCount;
    uint16_t sectionHeaderEntrySize;
    uint16_t sectionHeaderEntryCount;
    uint16_t sectionHeaderStringTableIndex;
}__attribute__((packed));

struct ELF_ProgramHeader{
    uint32_t type;
    uint32_t flags;
    uint64_t offset;
    uint64_t virtualAddress;
    uint64_t physicalAddress;
    uint64_t fileSize;
    uint64_t memorySize;
    uint64_t alignment;
}__attribute__((packed));

void* loadELFFile(File* file);

#endif