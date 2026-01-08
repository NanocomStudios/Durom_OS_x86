#include <limine.h>
#include <cstddef>

#include "VGA.h"
#include "../StdLib/malloc.h"
#include "../IO/io.h"

int currentCursorLoc;
Color foreColor;
Color backColor;

unsigned short height;
unsigned short width;
unsigned short pitch;

unsigned short consoleHeight = 25;
unsigned short consoleWidth = 80 ;

unsigned char bpp;

unsigned screenWidth;

void* screenRam;
void* physicalScreenRam;

char graphicMode;

char scroll;

extern char font_start;

// The Limine requests can be placed anywhere, but it is important that
// the compiler does not optimise them away, so, usually, they should
// be made volatile or equivalent, _and_ they should be accessed at least
// once or marked as used with the "used" attribute as done here.

namespace {

__attribute__((used, section(".limine_requests")))
volatile limine_framebuffer_request framebuffer_request = {
    .id = LIMINE_FRAMEBUFFER_REQUEST_ID,
    .revision = 0,
    .response = nullptr
};

}

extern "C"{
    void *memcpy(void *__restrict dest, const void *__restrict src, std::size_t n);
}


void clearScreen(){
    
    for(int row = 0; row < height; row++){
        for(int col = 0; col < screenWidth; col++){
            if(bpp == 32){
                *((Color32*)screenRam + (col + (row * screenWidth))) = backColor;
            }else{
                *((Color*)screenRam + (col + (row * screenWidth))) = backColor;
            }
            
        }
    }
    renderScreen();
}

void clearConsole(){
    moveCsr(0,0);
    clearScreen();
}

void initScreen(){
    Color white;
    white.R = 255;
    white.G = 255;
    white.B = 255;

    Color black;
    black.R = 0;
    black.G = 0;
    black.B = 0;

    // Ensure we got a framebuffer.
    if (framebuffer_request.response == nullptr
     || framebuffer_request.response->framebuffer_count < 1) {
        while(1);
    }

    // Fetch the first framebuffer.
    limine_framebuffer *framebuffer = framebuffer_request.response->framebuffers[0];

    physicalScreenRam = (void*)framebuffer->address;
    height = framebuffer->height;
    width = framebuffer->width;
    bpp = framebuffer->bpp;
    pitch = framebuffer->pitch;
    graphicMode ='G';
    
    screenRam = (void*)malloc(pitch * height);
    

    consoleWidth = width / charWidth;
    consoleHeight = height / charHeight; 

    screenWidth = pitch * 8 / bpp;

    foreColor = {255,255,255};
    backColor = {36,10,48};
    clearScreen();
    scroll = 1;
    
}

void printDisplayInfo(){
    print("BPP :");
    printInt(bpp);
    print('\n');

    print("Height :");
    printInt(height);
    print('\n');

    print("Width :");
    printInt(width);
    print('\n');

    print("Pitch :");
    printInt(pitch);
    print('\n');
}

void print(const char* inp){
    for(int i = 0;*(inp + i) != 0; i++){
        print(*(inp + i));
    }
}

void printInt(long inp){
    long length = len(inp);
    char* charBuffer = (char*)malloc(length);

    if(inp < 0){
        print('-');
        inp *= -1;
    }
    long i = 0;
    for(long i = 0; i < length; i++){
        *(charBuffer + i) = (inp % 10) + 0x30;
        inp = inp / 10;
    }
    for(long i = length - 1; i >= 0; i--){
        print(*(charBuffer + i));
    }

    free(charBuffer);

}

void printHex(long inp){

    long length = lenH(inp);
    char* charBuffer = (char*)malloc(length * 2);

    for(short i = 0; i < length; i ++){
        *(charBuffer + (i * 2)) = hexToAscii((*(unsigned char*)((char*)&inp + i)) % 16);
        *(charBuffer + (i * 2) + 1) = hexToAscii((*(unsigned char*)((char*)&inp + i)) / 16);
    }

    print("0x");

    for(long i = (length * 2) - 1; i >= 0; i--){
        print(*(charBuffer + i));
    }
    free(charBuffer);
}

void printHexV(long inp){

    long length = lenH(inp);
    char* charBuffer = (char*)malloc(length * 2);

    for(short i = 0; i < length; i ++){
        *(charBuffer + (i * 2)) = hexToAscii((*(unsigned char*)((char*)&inp + i)) % 16);
        *(charBuffer + (i * 2) + 1) = hexToAscii((*(unsigned char*)((char*)&inp + i)) / 16);
    }

    for(long i = (length * 2) - 1; i >= 0; i--){
        print(*(charBuffer + i));
    }
    free(charBuffer);
}

char hexToAscii(char inp){
    if(inp < 10){
        return (inp + 0x30);
    }else if(inp < 16){
        return (inp - 9 + 0x40);
    }
    return 0;
}

int len(long inp){
    long length = 0;
    if(inp < 0){
        inp *= -1;
    }
    do{
        inp = inp / 10;
        length ++;
    }while(inp > 0);
    return length;
}

int lenH(long inp){
    long length = 0;
    if(inp < 0){
        inp *= -1;
    }
    do{
        inp = inp / 256;
        length ++;
    }while(inp > 0);
    return length;
}

void scrollScreen(){
            for(int i = 0; i < (screenWidth * (height - 14)); i++){
                if(bpp == 32){
                    *((Color32*)screenRam + i) = *((Color32*)screenRam + i + (screenWidth * 14));
                }else{
                    *((Color*)screenRam + i) = *((Color*)screenRam + i + (screenWidth * 14));
                }
                
            }
            for(int i = (screenWidth * (height - 14)); i < (screenWidth * height); i++){
                if(bpp == 32){
                    *((Color32*)screenRam + i) = backColor;
                }else{
                    *((Color*)screenRam + i) = backColor;
                }
               
            }
            moveCsr(0, consoleHeight - 1);
            renderScreen();
}

// void print(char inp){
//     asm volatile("mov $1, %rax");
//     asm volatile("mov %0, %%rbx" :: "r"((long)inp));
//     asm volatile("int $0x80");
// }

void print(char inp){
    switch (inp)
    {
    case '\n':
        if(((currentCursorLoc / consoleWidth) + 1) >= consoleHeight){
            scrollScreen();
        }else{
            moveCsr(0, (currentCursorLoc / consoleWidth) + 1);
        }
        break;
    
    case '\b':

        if(currentCursorLoc > 0){
            csrDec();
            print(' ');
            csrDec();
        }

        break;
    
    default:
        drawChar(inp, ((currentCursorLoc % consoleWidth) * 9), ((currentCursorLoc / consoleWidth) * 14), foreColor, backColor);
        csrInc();
        break;
    }
}

void moveCsr(int col, int row){
    currentCursorLoc = col + (row * consoleWidth);
    outb(0x3D4, 0xf);
    outb(0x3D5, (unsigned char)(currentCursorLoc & 0xff));
    outb(0x3D4, 0xe);
    outb(0x3D5, (unsigned char)((currentCursorLoc >> 8) & 0xff));
}

void csrInc(){
    currentCursorLoc++;

    if((currentCursorLoc >= consoleWidth * (consoleHeight))){
            scrollScreen();
    }
    outb(0x3D4, 0xf);
    outb(0x3D5, (unsigned char)(currentCursorLoc & 0xff));
    outb(0x3D4, 0xe);
    outb(0x3D5, (unsigned char)((currentCursorLoc >> 8) & 0xff));
}

void csrDec(){

    if(currentCursorLoc > 0){
        currentCursorLoc--;

        outb(0x3D4, 0xf);
        outb(0x3D5, (unsigned char)(currentCursorLoc & 0xff));
        outb(0x3D4, 0xe);
        outb(0x3D5, (unsigned char)((currentCursorLoc >> 8) & 0xff));
    }
    
}

void setForeColor(Color color){
    foreColor = color;
}

void setBackColor(Color color){
    backColor = color;
}

void setColor(int col, int row, char fgC = -1, char bgC = -1){
    // if (fgC == -1){
    //     fgC = foreColor;
    // }
    // if(bgC == -1){
    //     bgC = backColor;
    // }

    // //*((screenRam + (col + (row * consoleWidth)) * 2) + 1) = fgC + (bgC << 4);

}

void drawLine(short x1, short y1, short x2, short y2, Color color){
    int x;
	int y;
	if (x1 > x2) {
		for (x = x2; x <= x1; x++) {
			y = y1 + (((y1 - y2) / (int)(x1 - x2)) * (x - x1));

            if((y - int(y)) > 0){
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + (((int)y + 1) * screenWidth)) = antiAliasing(y - int(y),color);
                }else{
                    *((Color*)screenRam + (int)x + (((int)y + 1) * screenWidth)) = antiAliasing(y - int(y),color);
                }
                
            }else if((y - int(y)) < 0){
                
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(y - int(y),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(y - int(y),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + (((int)y - 1) * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }else{
                    *((Color*)screenRam + (int)x + (((int)y - 1) * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }

            }else{
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }
            }

            
			
		}
	}
	else if (x1 < x2) {
		for (x = x1; x <= x2; x++) {
			y = y1 + (((y1 - y2) / (int)(x1 - x2)) * (x - x1));
			if((y - int(y)) > 0){
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + (((int)y + 1) * screenWidth)) = antiAliasing(y - int(y),color);
                }else{
                    *((Color*)screenRam + (int)x + (((int)y + 1) * screenWidth)) = antiAliasing(y - int(y),color);
                }
                
            }else if((y - int(y)) < 0){
                
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(y - int(y),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(y - int(y),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + (((int)y - 1) * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }else{
                    *((Color*)screenRam + (int)x + (((int)y - 1) * screenWidth)) = antiAliasing(1 - (y - int(y)),color);
                }

            }else{
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }
            }
		}
	}

	if (y1 > y2) {
		for (y = y2; y <= y1; y++) {
			x = (((y - y1) / (int)(y1 - y2)) * (x1 - x2)) + x1;
			if((x - int(x)) > 0){
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + 1 + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }else{
                    *((Color*)screenRam + (int)x + 1 + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }
            }else if((x - int(x)) < 0){
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x - 1 + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }else{
                    *((Color*)screenRam + (int)x - 1 + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }
            }else{
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }
            }
		}
	}
	else if (y1 < y2) {
		for (y = y1; y <= y2; y++) {
			x = (((y - y1) / (int)(y1 - y2)) * (x1 - x2)) + x1;
			if((x - int(x)) > 0){
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + 1 + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }else{
                    *((Color*)screenRam + (int)x + 1 + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }
            }else if((x - int(x)) < 0){
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = antiAliasing(x - int(x),color);
                }

                if(bpp == 32){
                    *((Color32*)screenRam + (int)x - 1 + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }else{
                    *((Color*)screenRam + (int)x - 1 + ((int)y * screenWidth)) = antiAliasing(1 - (x - int(x)),color);
                }
            }else{
                if(bpp == 32){
                    *((Color32*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }else{
                    *((Color*)screenRam + (int)x + ((int)y * screenWidth)) = color;
                }
            }
		}
	}
    renderScreen();
}

void drawRectangle(short x1, short y1, short x2, short y2, Color color){
    drawLine(x1, y1, x2, y1, color);
    drawLine(x1, y1, x1, y2, color);
    drawLine(x2, y1, x2, y2, color);
    drawLine(x1, y2, x2, y2, color);
}

void fillRectangle(short x1, short y1, short x2, short y2, Color fillColor){
    if(y1 > y2){
        short tmp = y2;
        y2 = y1;
        y1 = tmp;
    }
    if(x1 > x2){
        short tmp = x2;
        x2 = x1;
        x1 = tmp;
    }
    for(short y = y1; y <= y2; y++){
        for(short x = x1; x <= x2; x++){
            if(bpp == 32){
                *((Color32*)screenRam + x + y * screenWidth) = fillColor;
            }else{
                *((Color*)screenRam + x + y * screenWidth) = fillColor;
            }
            
        }
    }
    renderScreen();
}

Color antiAliasing(int val, Color color){//float

    color.R = (int)(val * color.R);
    color.G = (int)(val * color.G);
    color.B = (int)(val * color.B);

    return color;
}

void drawChar(char inp, short x, short y, Color fgColor, Color bgColor){
    
    
    for(int i = 0; i < 14; i++){
            for(int j = 0; j < 8; j++){
                if(((*(char*)(long)((&font_start) + (inp * 14) + i)) & (128 >> j))){
                    if(bpp == 32){
                        *((Color32*)screenRam + (j + x) + ((i + y) * screenWidth)) = fgColor;
                        *((Color32*)physicalScreenRam + (j + x) + ((i + y) * screenWidth)) = fgColor;
                    }else{
                        *((Color*)screenRam + (j + x) + ((i + y) * screenWidth)) = fgColor;
                        *((Color*)physicalScreenRam + (j + x) + ((i + y) * screenWidth)) = fgColor;
                    }
                    
                }else{
                    if(bpp == 32){
                        *((Color32*)screenRam + (j + x) + ((i + y) * screenWidth)) = bgColor;
                        *((Color32*)physicalScreenRam + (j + x) + ((i + y) * screenWidth)) = bgColor;
                    }else{
                        *((Color*)screenRam + (j + x) + ((i + y) * screenWidth)) = bgColor;
                        *((Color*)physicalScreenRam + (j + x) + ((i + y) * screenWidth)) = bgColor;
                    }
                }
            }
            if(bpp == 32){
                *((Color32*)screenRam + (8 + x) + ((i + y) * screenWidth)) = bgColor;
                *((Color32*)physicalScreenRam + (8 + x) + ((i + y) * screenWidth)) = bgColor;
            }else{
                *((Color*)screenRam + (8 + x) + ((i + y) * screenWidth)) = bgColor;
                *((Color*)physicalScreenRam + (8 + x) + ((i + y) * screenWidth)) = bgColor;
            }
           
    }
}

void renderScreen(){
    memcpy(physicalScreenRam, screenRam, pitch * height);
}

void hexdump(char* addr, int len){
    for(int i = 0; i < len; i++){
        if(i % 16 == 0){
            print('\n');
            printHex((long)(addr + i));
            print(": ");
        }
        printHexV((long)(*(addr + i)));
        print(' ');
    }
    print('\n');
}