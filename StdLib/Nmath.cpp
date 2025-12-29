#include "Nmath.h"

long pow(int inp, int exp){
    long tmp = 1;
    for(int i = 0; i < exp; i++){
        tmp *= inp;
    }
    return tmp;
}

uint64_t ceiling_div(uint64_t num, uint64_t div){
    if(num % div == 0){
        return num / div;
    }else{
        return (num / div) + 1;
    }
}