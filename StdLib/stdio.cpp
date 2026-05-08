#include "stdio.h"

#include "../Graphics/VGA.h"

#include <cstdarg>
#include <cstdint>

int printf(char* input, ...){
    uint64_t argCount = 0;
    uint64_t charCount = 0;
    char currentChar = input[0];

    while(currentChar != 0){
        if(currentChar == '%'){
            charCount++;
            currentChar = input[charCount];
            switch (currentChar){
                case 0:
                    return charCount;
                
                case 'd':
                case 'i':
                // case 'u':
                case 'c':
                case 's':
                case 'x':
                case 'X':
                case 'p':
                // case 'f':
                    argCount++;
                    break;
                default:
                    break;
            }
        }
        charCount++;
        currentChar = input[charCount];
    }

    va_list args;
    va_start(args, argCount);

    currentChar = input[0];
    charCount = 0;

    while(currentChar != 0){
        if(currentChar == '%'){
            charCount++;
            currentChar = input[charCount];
            switch (currentChar){
                case 0:
                    return charCount;
                
                case 'd':
                case 'i':
                    printInt(va_arg(args, long));
                    break;

                // case 'u':
                case 'c':
                    print(va_arg(args, int));
                    break;
                case 's':
                    print(va_arg(args, char*));
                    break;
                case 'x':
                case 'X':
                    printHexV(va_arg(args, long));
                    break;
                case 'p':
                    printHex(va_arg(args, long));
                    break;
                // case 'f':
                
                    break;
                default:
                    print(currentChar);
                    break;
            }
        }else{
            print(currentChar);
        }
        charCount++;
        currentChar = input[charCount];
    }

    va_end(args);

    return 0;

}

int scanf(char* input, ...){
    
    return 0;
}