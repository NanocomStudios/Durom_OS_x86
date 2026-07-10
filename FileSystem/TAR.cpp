#include "TAR.h"

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