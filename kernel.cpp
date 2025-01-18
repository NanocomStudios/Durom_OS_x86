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

    

    char step = 0;
    
    print("DuRom x86 V1.0\n#>");
    
    string inpBuffer = (string)malloc(255);
    int inpBufferPtr = 0;

    while(1){
        for(int i = 0; i < 256; i+=1){
            unsigned char red = 255;
            unsigned char green = 0;
            unsigned char blue = 0;
            step = 0;
            for(int j = 0; j < (Kheight * Kwidth); j++){
                for(int k = 0; k < 10; k++){
                    (*(Pixal*)((KscreenRam + j) + (k * Kwidth))).R = red;
                    (*(Pixal*)((KscreenRam + j) + (k * Kwidth))).G = green;
                    (*(Pixal*)((KscreenRam + j) + (k * Kwidth))).B = blue;   
                }

                if(step == 0){
                    if(green == 255){
                        step = 1;
                    }else{
                        green++;
                    }
                }else if(step == 1){
                    if(red == 0){
                        step = 2;
                    }else{
                        red--;
                    }
                }else if(step == 2){
                    if(blue == 255){
                        step = 3;
                    }else{
                        blue++;
                    }
                }else if(step == 3){
                    if(green == 0){
                        step = 4;
                    }else{
                        green--;
                    }
                }else if(step == 4){
                    if(red == 255){
                        step = 5;
                    }else{
                        red++;
                    }
                }else if(step == 5){
                    if(blue == 0){
                        step = 0;
                        
                        j = (((j / Kwidth) + 10) * Kwidth) - 1;
                        continue;
                    }else{
                        blue--;
                    }
                }

                if(step == 0){
                    if(green == 255){
                        //step = 1;
                    }else{
                        green++;
                    }
                }else if(step == 1){
                    if(red == 0){
                        //step = 2;
                    }else{
                        red--;
                    }
                }else if(step == 2){
                    if(blue == 255){
                        //step = 3;
                    }else{
                        blue++;
                    }
                }else if(step == 3){
                    if(green == 0){
                        //step = 4;
                    }else{
                        green--;
                    }
                }else if(step == 4){
                    if(red == 255){
                        //step = 5;
                    }else{
                        red++;
                    }
                }else if(step == 5){
                    if(blue == 0){
                        // step = 0;
                        // j = (((j / Kwidth) + 10) * Kwidth) - 1;
                        // continue;
                    }else{
                        blue--;
                    }
                }

                if(((j + 1) % Kwidth) == 0){
                    j = ((j / Kwidth) + 10) * Kwidth;
                    j--;
                }

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