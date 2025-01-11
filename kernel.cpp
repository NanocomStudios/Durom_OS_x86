#include "screen.h"

extern "C" void main(){
    initScreen();
    moveCsr(0,1);
    printChar('H');
    char name[] = "hello";
    print(name);
    return;
}