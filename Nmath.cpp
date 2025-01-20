#include "Nmath.h"

long pow(int inp, int exp){
    long tmp = 1;
    for(int i = 0; i < exp; i++){
        tmp *= inp;
    }
    return tmp;
}