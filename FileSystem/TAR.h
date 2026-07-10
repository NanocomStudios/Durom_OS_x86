#ifndef TAR_H
#define TAR_H

#include "../StdLib/vector.h"
#include "../StdLib/Nstring.h"
#include "fileSystem.h"

#define TAR_FILE_TYPE_DEFAULT 0

class [[gnu::packed]] TAR_Header{
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

    public:
        char isValidTARHeader();
        uint64_t read(char* buffer, uint64_t length, uint64_t skip = 0);
        uint64_t write(char* buffer, uint64_t length, uint64_t skip = 0);
};

class TAR_FS{
    TAR_Header* firstHeader;

    public:
        TAR_FS(TAR_Header* header){
            firstHeader = header;
        }

        
};
#endif