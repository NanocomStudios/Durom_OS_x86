#include "VGA.h"
#include "malloc.h"
#include "io.h"
#include "keyboard.h"
#include "Nstring.h"


typedef char * string;

unsigned short Kheight;
unsigned short Kwidth;

Pixal* KscreenRam;

int main(){

    print("DuRom x86 V1.0\n#>");
    
    string inpBuffer = (string)malloc(255);
    int inpBufferPtr = 0;

    while(1){
        for(int i = 0; i < 256; i+=1){
            for(int j = 0; j < (Kheight * Kwidth); j++){
                (*(Pixal*)(KscreenRam + j)).R = ((j % 256) + i) % 256;
                (*(Pixal*)(KscreenRam + j)).G = ((j % 256) + i) % 256;
                (*(Pixal*)(KscreenRam + j)).B = ((j % 256) + i) % 256;
            }
        }
    }

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
                    print('\'');
                    print(inpBuffer);
                    print("\' is not a valid Command.\n");
                }

                inpBufferPtr = 0;
                print("#>");
                break;
            case '\b':

                if(inpBufferPtr > 0){
                    inpBufferPtr --;
                    print('\b');
                }

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

    Kheight = (*(VesaInfoBlock*)0x500).height;
    Kwidth = (*(VesaInfoBlock*)0x500).width;
    KscreenRam = (Pixal*)(*(VesaInfoBlock*)0x500).framebuffer;

    main();
    return;
}