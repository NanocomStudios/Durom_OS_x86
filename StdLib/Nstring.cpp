#include "Nstring.h"
#include "Nmath.h"
#include "../Graphics/VGA.h"

long strcmp(const char * inp1, long length1, const char * inp2, long length2){
    
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
        if((inp[i] >= 0x30) && (inp[i] <= 0x39)){
            tmp = tmp + ((inp[i] - 0x30) * (pow(10,length - i -1)));
        }
    }
    return tmp;
}

char strcmpd(char* str1, char* str2){
    int i = 0;
    while(i < 2147483647){
        if((str1[i] == 0) || (str2[i] == 0)){
            if((str1[i] == 0) && (str2[i] == 0)){
                return 1;
            }else{
                return 0;
            }
        }
        if(str1[i] != str2[i]){
            return 0;
        }
        i++;
    }
}