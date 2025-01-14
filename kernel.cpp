#include "CGA.h"
#include "malloc.h"
#include "io.h"
#include "keyboard.h"
#include "Nstring.h"


typedef char * string;

int main(){
    print("DuRom x86 V1.0\n#>");
    
    string inpBuffer = (string)malloc(255);
    int inpBufferPtr = 0;

    while(1){
        
        char key = getChar();

        switch (key){
            case '\n':
                print('\n');
                inpBuffer[inpBufferPtr] = 0;

                //print(inpBuffer);

                if (!strcpy(inpBuffer, 255, "clear", 6)){
                    clrScr();
                }else if(!strcpy(inpBuffer, 255, "help", 5)){
                    print("Showing help.\n");
                }else if(inpBufferPtr == 0){

                }else{
                    print("Command not available.\n");
                }

                inpBufferPtr = 0;
                print("#>");
                break;

            default:
                print(key);
                inpBuffer[inpBufferPtr++] = key;

                if(inpBufferPtr > 255){
                    print("Input Buffer Exceeded!\n#>");
                    inpBufferPtr = 0;
                }

                //printHex(key);
                break;
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