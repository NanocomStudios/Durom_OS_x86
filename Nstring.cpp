#include "Nstring.h"
#include "VGA.h"

long strcpy(const char * inp1, long length1, const char * inp2, long length2){
    
    long tmp;

    if(length1 > length2){
        tmp = length2;
        
        for(long i = 0; i < length2; i++){
            if(inp1[i] == inp2[i]){
                tmp--;
            }
        }
        
    }else{
        tmp = length1;

        for(long i = 0; i < length1; i++){
            if(inp1[i] == inp2[i]){
                tmp--;
            }
        }
    }
    return tmp;

}

long toInt(const char * inp, int length){
    long tmp = 0;
    for(int i = length - 1; i >= 0; i--){
        if((inp[i] <= 0x30) && (inp[i] >= 0x39)){
            
        }
    }
}