#include "screen.h"

extern "C" void main(){
    initScreen();
    moveCsr(0,2);
    printChar('H');
    char name[] = "hello";
    print(name);

    return;
}