#include "Operations.h"
#include <stdint.h>

void changeEndien(void* array, int length){
    uint8_t* arr = (uint8_t*)array;
    uint8_t tmp;
    length--;
    for(int i = 0; i < length; i++){
        tmp = arr[i];
        arr[i] = arr[length];
        arr[length] = tmp;
        length--;
    }
}

uint16_t calculateChecksum(void* header, int length){
    unsigned int sum = 0;
    uint8_t tmp[2];
    uint8_t* arr = (uint8_t*)header;
    while(length > 1){

        tmp[1] = *arr++;
        tmp[0] = *arr++;

        sum += *(uint16_t*)(tmp);
        length -= 2;
    }

    if(length == 1){
        tmp[1] = 0;
        tmp[0] = *arr;

        sum += *(uint16_t*)(tmp);
    }

    while (sum>>16)
        sum = (sum & 0xffff) + (sum >> 16);

    changeEndien(&sum, 2);
    return (uint16_t)(~sum);
}