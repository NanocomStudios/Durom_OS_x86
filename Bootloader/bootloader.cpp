#include "../StdLib/malloc.h"
#include "../Storage/hdd.h"
#include "../Storage/fat32.h"
#include "../Graphics/VGA.h"
#include "../Graphics/GUI.h"
#include "../IO/io.h"
#include "../IO/PCI.h"

void main(){
    printPciList();
    print('\n');
    listHdd();
}

extern "C" void init(){

    initScreen();
    mallocInit();
    initGUI();
    pciInit();
    hddInit();

    main();
    return;
}