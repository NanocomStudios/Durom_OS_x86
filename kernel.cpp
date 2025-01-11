#include "screen.h"
#include "malloc.h"

int main(){
    char name[] = "Durom v1.0\nNanocom mini Operating System.\nC:>";
    print(name);
    print("Hello world\n");
    
    int* ptr = (int*)malloc(0);
    int* ptr1 = (int*)malloc(4);
    malloc(124);
    //*ptr = 25314;

    printInt((long)ptr);
    //print(' ');
    //printInt(*ptr1);
    return 0;
}

extern "C" void init(){
    initScreen();
    mallocInit();
    main();
    return;
}