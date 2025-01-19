#include "VGA.h"
#include "malloc.h"
#include "io.h"

int currentCursorLoc;
Color foreColor;
Color backColor;

unsigned short height;
unsigned short width;

Color* screenRam;
char graphicMode;

char scroll;

VesaInfoBlock* vesaInfoBlock;

void clearScreen(){
    
    for(int row = 0; row < height; row++){
        for(int col = 0; col < width; col++){
            *(screenRam + (col + (row * width))) = backColor;
        }
    }
}

void clearConsole(){
    moveCsr(0,0);
    scroll = 0;
    for(int i = 0; i < (consoleHeight * consoleWidth);i++){
        print(' ');
    }
    scroll = 1;
    moveCsr(0,0);
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

    vesaInfoBlock = (VesaInfoBlock*)0x500;
    
    if(vesaInfoBlock -> framebuffer){
        screenRam = (Color*)vesaInfoBlock -> framebuffer;
        height = vesaInfoBlock -> height;
        width = vesaInfoBlock -> width;
        graphicMode ='G';

    }else{
        //screenRam = (Color*)(0xB8000);
        graphicMode = 'T';
    }
    foreColor = {255,255,255};
    backColor = {36,10,48};
    clearScreen();
    scroll = 1;
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
            for(int i = 0; i < (width * (height - 1)); i++){
                *(screenRam + i) = *(screenRam + i + (width * 14));
            }
            for(int i = (width * (height - 14)); i < (width * height); i++){
               *(screenRam + i) = backColor;
            }
            moveCsr(0, consoleHeight - 1);
}

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
        drawChar(inp, ((currentCursorLoc % consoleWidth) * 9), ((currentCursorLoc / consoleWidth) * 14), backColor, foreColor);
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

// void setColor(int col, int row, char fgC = -1, char bgC = -1){
//     if (fgC == -1){
//         fgC = foreColor;
//     }
//     if(bgC == -1){
//         bgC = backColor;
//     }

//     //*((screenRam + (col + (row * consoleWidth)) * 2) + 1) = fgC + (bgC << 4);

// }

void drawLine(short x1, short y1, short x2, short y2, Color color){
    float x;
	float y;
	if (x1 > x2) {
		for (x = x2; x <= x1; x++) {
			y = y1 + (((y1 - y2) / (float)(x1 - x2)) * (x - x1));
			*(screenRam + (int)x + ((int)y * width)) = color;
		}
	}
	else if (x1 < x2) {
		for (x = x1; x <= x2; x++) {
			y = y1 + (((y1 - y2) / (float)(x1 - x2)) * (x - x1));
			*(screenRam + (int)x + ((int)y * width)) = color;
		}
	}

	if (y1 > y2) {
		for (y = y2; y <= y1; y++) {
			x = (((y - y1) / (float)(y1 - y2)) * (x1 - x2)) + x1;
			*(screenRam + (int)x + ((int)y * width)) = color;
		}
	}
	else if (y1 < y2) {
		for (y = y1; y <= y2; y++) {
			x = (((y - y1) / (float)(y1 - y2)) * (x1 - x2)) + x1;
			*(screenRam + (int)x + ((int)y * width)) = color;
		}
	}
}

void drawRectangle(short x1, short y1, short x2, short y2, Color color){
    drawLine(x1, y1, x2, y1, color);
    drawLine(x1, y1, x1, y2, color);
    drawLine(x2, y1, x2, y2, color);
    drawLine(x1, y2, x2, y2, color);
}

void fillRectangle(short x1, short y1, short x2, short y2, Color fillColor){
    if(y1 < y2){
        for(short y = y1; y <= y2; y++){
            drawLine(x1, y, x2, y, fillColor);
        }
    }else{
        for(short y = y2; y <= y1; y++){
            drawLine(x1, y, x2, y, fillColor);
        }
    }
}

Color antiAliasing(float inp, Color color){
    double val;

    if(inp == (int)inp){
        val = 0;
    }else{
        val = inp - (int)inp;
    }
    val = 1 - val;

    color.R = (int)(val * color.R);
    color.G = (int)(val * color.G);
    color.B = (int)(val * color.B);

    return color;
}

void drawChar(char inp, short x, short y, Color fgColor, Color bgColor){
    for(int i = 0; i < 14; i++){
            for(int j = 0; j < 8; j++){
                if(((*(char*)(0x1000 + 3 + (inp * 14) + i)) & (128 >> j))){
                    *(screenRam + (j + x) + ((i + y) * width)) = bgColor;
                }else{
                    *(screenRam + (j + x) + ((i + y) * width)) = fgColor;
                }
            }
            *(screenRam + (8 + x) + ((i + y) * width)) = fgColor;
    }
}