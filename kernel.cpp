#include "CGA.h"
#include "malloc.h"
#include "io.h"
#include "keyboard.h"

typedef char * string;

int main(){
    print("DuRom x86 V1.0\n#>");
    
    string inpBuffer = (string)malloc(255);
    int inpBufferPtr = 0;

    unsigned char lastKey = 0;
    unsigned char key;
    outb(0x42, 255);
    while(1){
        key = inb(0x60);
        
        if((key < 128) && (key != lastKey)){
            
            switch (key){
                case 0x1c:
                    print('\n');
                    inpBuffer[inpBufferPtr] = 0;

                    //print(inpBuffer);

                    // if (inpBuffer == "clear"){
                    //     clrScr();
                    // }

                    inpBufferPtr = 0;
                    print("#>");
                    break;

                default:
                    print(toAscii(key));
                    inpBuffer[inpBufferPtr++] = toAscii(key);

                    if(inpBufferPtr > 255){
                        print("Input Buffer Exceeded!\n#>");
                        inpBufferPtr = 0;
                    }

                    //printHex(key);
                    break;
            }
            lastKey = key;

        }else if((key > 127) && (key = lastKey + 128)){
            lastKey = 0;
        }
        
    }
    return 0;
}

extern "C" void init(){
    initScreen();
    mallocInit();
    main();
    return;
}