#include "CGA.h"
#include "malloc.h"
#include "io.h"
#include "keyboard.h"

int main(){
    char name[] = "Durom v1.0\nNanocom mini Operating System.\nC:>";
    print(name);
    print("Hello world\n");
    printInt(12457);
    print('\n');
    printHex(0x75FA);
    
    unsigned char lastKey = 0;
    unsigned char key;
    while(1){
        key = inb(0x60);
        if((key < 128) && (key != lastKey)){
            //print(toAscii(key));
            printHex(key);
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