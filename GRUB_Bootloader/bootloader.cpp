#include "../StdLib/malloc.h"
#include "../Storage/hdd.h"
#include "../Storage/fat32.h"
#include "../Graphics/VGA.h"
#include "../Graphics/GUI.h"
#include "../IO/io.h"
#include "../IO/PCI.h"
#include "../StdLib/Nstring.h"

void searchKernel(){
    hddEntry* hddEntryList;
    // short hddCount;

    hddEntryList = getHddEntryList();

    short partitionCount = getPartitionCount();

    VolumeInfo* vol = (VolumeInfo*)malloc(sizeof(VolumeInfo));

    for(short i = 0; i < partitionCount; i++){
        PartitionListNode* pList = getPartition(i);
        setDrive(hddEntryList[pList->hddEntryIndex].baseAddress, hddEntryList[pList->hddEntryIndex].masterSlave);
        hddWait();
        readSectors(vol, 1, (pList->partition).LBABegin);
        unsigned int rootDir = pList->partition.LBABegin + vol->rsvdSecCount + (vol->fatCount * vol->fatSize32Bit);

        DirectoryEntry* tmpCluster = (DirectoryEntry*)malloc(512 * (vol->secPerClus));

        readSectors(tmpCluster, vol->secPerClus, rootDir);
        
        for(int entry = 0; entry < (16 * vol->secPerClus); entry++){
            if(!strcmp(tmpCluster[entry].shortName, 11, "KERNEL  BIN", 11)){
                print("Kernel found!\n");
                printInt(tmpCluster[entry].size);
                print(" Bytes\nLoading...\n");
                
                return;
            }
        }
        print("Kernel.bin not found!\n");
        
    }
    drawLine(20,100,400,20,{0,255,255});
}

void main(){
    printPciList();
    print('\n');
    listHdd();
    printPartitionList();
    searchKernel();
    
}

extern "C" void init(){
    *((char*) (0xB8000)) = 'A';
    while(1);
    initScreen();
    mallocInit();
    initGUI();
    pciInit();
    hddInit();
    initFat32Drives();

    main();
    return;
}