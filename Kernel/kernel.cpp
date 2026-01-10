#include "kernel.h"
#include "interrupt.h"
#include "isr.h"

#include "../Graphics/VGA.h"
#include "../StdLib/malloc.h"
#include "../IO/io.h"
#include "../HID/keyboard.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/Nmath.h"
#include "../Graphics/GUI.h"
#include "../IO/ps2.h"
#include "../Storage/hdd.h"
#include "../Storage/fat32.h"
#include "../IO/PCI.h"
#include "../Drivers/PIC/PIC.h"
#include "../Drivers/Audio/pc_speaker.h"
#include "../Memory/PMM.h"
#include "../Memory/Paging.h"

#include "../StdLib/queue.h"
#include "../StdLib/rb_tree.h"
#include "../StdLib/vector.h"
#include "../StdLib/lock.h"

#include "../Drivers/Network/networkDriver.h"

#include <limine.h>

typedef char * string;

int step;
int main(){
    
    Color border = {0,255,0};

    print("DuRom x86_64 V2.0\n");
    
    string inpBuffer = (string)malloc(255);
    int inpBufferPtr = 0;
    Window* window1 = openWindow(0,0,400,500);
    Window* window2 = openWindow(50,50,500,600);

    char focused = 0;
    char colorTmp = 0;

    ((Box*)(getGraphicObject(window1, 0)->Object))->fillColor = {0,0,0};
    //printInt(((Box*)(window1->childList->Object))->fillColor.G);

    //drawWindows();

    //outb(0x64, 0x20);
    
    // ps2Write(0xF6);
    // ps2Write(0xF4);
    // ps2Write(0xF0);
    
    // outb(0x1f6, 0xE0);
    // outb(0x1f7, 0xec);
    
    // DriveInfo* dBuffer = (DriveInfo*)malloc(sizeof(DriveInfo));
    // getDriveInfo(dBuffer);
    // print(dBuffer->modelNumber);
    // print('\n');

    // free(dBuffer);
    
    // int i = 0 ;
    // outb(0x1f7,0x20);
    // while((i < (512)) && (inb(0x1f7) & (unsigned char)8)){
    //     unsigned short inp = inw(0x1f0);
    //     printHex(inp);
    //     print(' ');

    //     i++;
    // }
    // for(int bus = 0 ; bus < 256; bus++){
    //     for(int device = 0; device < 32; device++){
    //         if(pciConfigReadWord(bus,device,0,14) == 0x80){
    //             for(int func = 0; func < 8; func++){
    //                 unsigned short tmp = pciConfigReadWord(bus,device,func,10);
    //                 if(tmp != 0xFFFF){
    //                     printHex(pciConfigReadWord(bus,device,0,10));
    //                     print("->");
    //                     printHex(pciConfigReadWord(bus,device,func,14));
    //                     print('=');
    //                     printHex(tmp);
    //                     print(' ');
    //             }
    //             }
    //         }else{
    //             unsigned short tmp = pciConfigReadWord(bus,device,0,10);
    //             if(tmp != 0xFFFF){
    //                 printHex(pciConfigReadWord(bus,device,0,14));
    //                 print('=');
    //                 printHex(tmp);
    //                 print(' ');
    //             }
    //         }
    //     }
    // }

    // printPciList();
    // MBR* mbr = (MBR*)malloc(512);

    // VolumeInfo* vol1 = (VolumeInfo*)malloc(512);

    // readSectors(mbr, 1, 0);

    // readSectors(vol1, 1, mbr->p1.LBABegin);

    // unsigned int rootDir = mbr->p1.LBABegin + vol1->rsvdSecCount + (vol1->fatCount * vol1->fatSize32Bit);

    // DirectoryEntry* tmpSector = (DirectoryEntry*)malloc(512);

    // readSectors(tmpSector, 1, rootDir);
    // printInt(vol1->secPerClus);
    // print('\n');
    
    // for(int i = 0; i < 16; i++){
    //     //if(tmpSector[i].attribute != 0x20)continue;
    //     for(int j = 0; j < 8; j++){
    //         print(tmpSector[i].shortName[j]);
    //     }
    //     print('.');
    //     for(int j = 8; j < 11; j++){
    //         print(tmpSector[i].shortName[j]);
    //     }
    //     //printHex(tmpSector[i].attribute);
    //     print("\n");
    // }

    

    // for(int i = 0; i < 512; i++){
    //     printHexV(*(((char*)mbr) + i));
    //     print(' ');
    // }

    
    Spinlock lock;



    while(0){
        // if((inb(0x64) & (unsigned char)32) == 0){
        //     print("Keyboard -> ");
        // }else{
        //     print("Mouse -> ");
        // }
        ps2Write(0xeb);
        printHex(ps2Read());
        print(' ');
        printHex(ps2Read());
        print(' ');
        printHex(ps2Read());
        print('\n');
    }
    
    print("#>");

    while(1){
        ps2Wait(READ);
        if((inb(0x64) & (unsigned char)32) == 0){
            
            char key = getChar();
            switch (key){
                case '\n':
                    print('\n');
                    inpBuffer[inpBufferPtr] = 0;

                    //print(inpBuffer);

                    if (!strcmp(inpBuffer, 255, "clear", 5)){
                        clearConsole();
                    }else if(!strcmp(inpBuffer, 255, "help", 4)){
                        print("Showing help.\n");
                    }else if(!strcmp(inpBuffer, 255, "box", 3)){
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

                    }else if(!strcmp(inpBuffer, 255, "close", 5)){
                        closeWindow(window1);
                        drawWindows();
                    }else if(!strcmp(inpBuffer, 255, "focus", 5)){
                        if(focused == 0){
                            bringWindowFront(window1);
                            focused = 1;
                        }else{
                            bringWindowFront(window2);
                            focused = 0;
                        }
                        drawWindows();
                    }else if(inpBufferPtr == 0){

                    }else if(!strcmp(inpBuffer, 255, "pci", 3)){
                        printPciList();
                    }else if(!strcmp(inpBuffer, 255, "display", 7)){
                        printDisplayInfo();
                    }else if(!strcmp(inpBuffer, 255, "memory", 6)){
                        printMemoryInfo();
                    }else if(!strcmp(inpBuffer, 255, "break", 5)){
                        asm("INT3");
                    }else if(!strcmp(inpBuffer, 255, "div0", 4)){
                        for(int i = -1;i < 2; i++){
                            printInt(5 / i);
                            print('\n');
                        }
                    }else if(!strcmp(inpBuffer, 255, "page", 4)){
                        *(long*)0 = 214;
                    }else if(!strcmp(inpBuffer, 255, "int", 3)){
                        asm("int $0x80");
                    }else if(!strcmp(inpBuffer, 255, "char", 4)){
                            asm volatile (
                                "movq $1, %%rax\n"
                                "movq $0x41, %%rbx\n"
                                "int $0x80\n"
                                :
                                :
                                : "rax", "rbx"
                            );
                    }else if(!strcmp(inpBuffer, 255, "acquire", 7)){
                        lock.acquire();
                        print("Lock Acquired!\n");
                    }else if(!strcmp(inpBuffer, 255, "release", 7)){
                        lock.release();
                        print("Lock Released!\n");
                    }else if(!strcmp(inpBuffer, 255, "beep", 4)){
                        
                        char tmp[20];
                        int chCnt = 0;
                        
                        for(int i = 5;(inpBuffer[i] != ' ') && (inpBuffer[i] != 0);i++){
                            if(i > 3){ 
                                tmp[chCnt] = inpBuffer[i];
                                chCnt++;
                            }
                        }
                        tmp[chCnt] = 0;
                        play_sound(toInt(tmp, chCnt));

                    }else if(!strcmp(inpBuffer, 255, "stop", 4)){
                        nosound();
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
        }else{
            
            
        }

        
    }
    return 0;
}

void init_drivers(){
    (long)networkDriverInit();
}

namespace {

__attribute__((used, section(".limine_requests")))
volatile limine_executable_address_request executable_address_request = {
    .id = LIMINE_EXECUTABLE_ADDRESS_REQUEST_ID,
    .revision = 0,
    .response = nullptr
};

__attribute__((used, section(".limine_requests")))
volatile limine_executable_file_request executable_file_request  = {
    .id = LIMINE_EXECUTABLE_FILE_REQUEST_ID,
    .revision = 0,
    .response = nullptr
};

}


// void stackTest(int a){
//     printInt(a);
//     uint64_t rsp;
//     asm volatile("mov %%rsp, %0" : "=r"(rsp));
//     print("Stack Pointer :- ");
//     printHex(rsp);
//     print('\n');
//     stackTest(a + 1);
//     print('\n');
// }

void init_kernel(){

    pmm_init();
    pagingInit();

    mallocInit(0x0000700000000000, 0x00007FFFFFFFB000 - 0x0000700000000000);
    initScreen();
    idt_init();
    initGUI();
    
    allocateToPageTable(0x00007FFFFFFFF000, (uint64_t)page_alloc(), 0x3); // Buffer

    allocateToPageTable(0x00007FFFFFFFE000, (uint64_t)page_alloc(), 0x3);// Stack
    allocateToPageTable(0x00007FFFFFFFD000, (uint64_t)page_alloc(), 0x3);// Stack
    allocateToPageTable(0x00007FFFFFFFC000, (uint64_t)page_alloc(), 0x3);// Stack
    allocateToPageTable(0x00007FFFFFFFB000, (uint64_t)page_alloc(), 0x3);// Stack

    asm volatile("movq %0, %%rsp" :: "r"(0x00007FFFFFFFF000));

    pciInit();
    init_drivers();

    PIC_remap(32,40);
    IRQ_set_mask_all();
    IRQ_clear_mask(PIC_TIMER);
    IRQ_clear_mask(PIC_KEYBOARD);
    sti();

    if (executable_address_request.response == nullptr) {
                while(1);
        }
    printHex(executable_address_request.response->physical_base);
    print('\n');
    printHex(executable_address_request.response->virtual_base);
    print('\n');
    
    if (executable_file_request.response == nullptr) {
                while(1);
        }
    printInt(executable_file_request.response->executable_file->size);
    print('\n');

    uint64_t cr3;
    asm volatile("mov %%cr3, %0" : "=r"(cr3));
    cr3 = cr3 & (0xFFFFFFFFF000);
    print("CR3 Page Table Address: ");
    printHex(cr3);
    print('\n');

    uint64_t rsp;
    asm volatile("mov %%rsp, %0" : "=r"(rsp));
    print("Stack Pointer :- ");
    printHex(rsp);
    print('\n');

    print("Init Complete.\n");
    print('\n');

    main();

    while(1)asm("hlt");
    
    return;
}