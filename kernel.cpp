#include "VGA.h"
#include "malloc.h"
#include "io.h"
#include "keyboard.h"
#include "Nstring.h"
#include "Nmath.h"
#include "GUI.h"

typedef char * string;

unsigned short Kheight;
unsigned short Kwidth;

Color* KscreenRam;

int step;
int main(){
    
    Color border = {0,255,0};

    print("DuRom x86 V1.0\n#>");
    
    string inpBuffer = (string)malloc(255);
    int inpBufferPtr = 0;
    Window* window1 = openWindow(0,0,400,500);
    Window* window2 = openWindow(50,50,500,600);

    char focused = 0;
    char colorTmp = 0;

    ((Box*)(getGraphicObject(window1, 0)->Object))->fillColor = {0,0,0};
    //printInt(((Box*)(window1->childList->Object))->fillColor.G);

    drawWindows();

    while(1){
        
        char key = getChar();
        switch (key){
            case '\n':
                print('\n');
                inpBuffer[inpBufferPtr] = 0;

                //print(inpBuffer);

                if (!strcpy(inpBuffer, 255, "clear", 5)){
                    clearConsole();
                }else if(!strcpy(inpBuffer, 255, "help", 4)){
                    print("Showing help.\n");
                }else if(!strcpy(inpBuffer, 255, "box", 3)){
                    int count = 0;
                    for(int i = 0; inpBuffer[i] != 0; i++){
                        for(;(inpBuffer[i] != ' ') && (inpBuffer[i] != 0);i++);
                        count ++;
                    }
                    if(count != 5){
                        print("Insufficient Argument count!\n");
                    }else{
                        int* listCoords = (int*) malloc(sizeof(int) * 4);

                        count = 0;
                        char tmp[20];
                        int chCnt = 0;

                        for(int i = 4; inpBuffer[i] != 0; i++){
                            chCnt = 0;
                            for(;(inpBuffer[i] != ' ') && (inpBuffer[i] != 0);i++){
                                if(i > 3){ 
                                    tmp[chCnt] = inpBuffer[i];
                                    chCnt++;
                                }
                            }
                            tmp[chCnt] = 0;
                            listCoords[count] = toInt(tmp, chCnt);
                            count ++;
                        }

                        drawRectangle(listCoords[0], listCoords[1], listCoords[2], listCoords[3], border);

                    }

                }else if(!strcpy(inpBuffer, 255, "close", 5)){
                    closeWindow(window1);
                    drawWindows();
                }else if(!strcpy(inpBuffer, 255, "focus", 5)){
                    if(focused == 0){
                        bringWindowFront(window1);
                        focused = 1;
                    }else{
                        bringWindowFront(window2);
                        focused = 0;
                    }
                    drawWindows();
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

    initGUI();

    Kheight = (*(VesaInfoBlock*)0x500).height;
    Kwidth = (*(VesaInfoBlock*)0x500).width;
    KscreenRam = (Color*)(*(VesaInfoBlock*)0x500).framebuffer;

    main();
    return;
}