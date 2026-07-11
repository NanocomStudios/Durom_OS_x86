#include "TAR.h"
#include "../StdLib/stdio.h"

char TAR_Header::isValidTARHeader(){
    return (
        magic[0] == 'u' &&
        magic[1] == 's' &&
        magic[2] == 't' &&
        magic[3] == 'a' &&
        magic[4] == 'r' &&
        magic[5] == 0
    );
}

uint64_t asciiOctToInt(char* input, uint64_t size){
    uint64_t output = 0;

    for(long i = (size - 2); i >= 0; i--){
        output += (input[i] - '0') << ((size - 2 - i) * 3);
    }
    return output;
}