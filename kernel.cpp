#include "screen.h"
#include "malloc.h"

int main(){
    char name[] = "Durom v1.0\nNanocom mini Operating System.\nC:>";
    print(name);
    print("Hello world\n");

    printInt(123456789);

    return 0;
}

extern "C" void init(){
    initScreen();
    mallocInit();
    main();
    return;
}