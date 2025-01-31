#include "../StdLib/malloc.h"
#include "../Storage/hdd.h"
#include "../Storage/fat32.h"

int main(){
    
}

extern "C" void init(){

    mallocInit();

    main();
    return;
}