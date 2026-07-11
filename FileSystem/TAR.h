#ifndef TAR_H
#define TAR_H

#include "../StdLib/vector.h"
#include "../StdLib/Nstring.h"
#include "fileSystem.h"

#define TAR_FILE_TYPE_FILE '0'
#define TAR_FILE_TYPE_DIRECTORY '5'
#define TAR_FILE_TYPE_LONG_NAME 'L'

class [[gnu::packed]] TAR_Header{
    public:

    char file_name[100];
    char mode[8];
    char uid[8];
    char gid[8];
    char size[12];
    char modified_time[12];
    char checksum[8];
    char typeflag;
    char name_linked[100];
    char magic[6];
    char version[2];
    char uname[32];
    char gname[32];
    char device_major_id[8];
    char device_minor_id[8];
    char file_name_prefix[155];

    
    char isValidTARHeader();
};

uint64_t asciiOctToInt(char* input, uint64_t size);
#endif