#include "VGA.h"
#include "malloc.h"
#include "io.h"

int currentCursorLoc;
char foreColor;
char backColor;

unsigned short height;
unsigned short width;

Color* screenRam;
char graphicMode;

VesaInfoBlock* vesaInfoBlock;

void clrScr(){

    if(graphicMode == 'T'){
        moveCsr(0,0);
        for(int row = 0; row < screenHeight; row++){
            for(int col = 0; col < screenWidth; col++){
                //*(screenRam + (col + (row * screenWidth)) * 2) = ' ';
                //*((screenRam + (col + (row * screenWidth)) * 2) + 1) = foreColor + (backColor << 4);
            }
        }
        moveCsr(0,0);
    }
}

void initScreen(){

    vesaInfoBlock = (VesaInfoBlock*)0x500;
    
    if(vesaInfoBlock -> framebuffer){
        screenRam = (Color*)vesaInfoBlock -> framebuffer;
        height = vesaInfoBlock -> height;
        width = vesaInfoBlock -> width;
        graphicMode ='G';
    }else{
        screenRam = (Color*)(0xB8000);
        graphicMode = 'T';
    }
    foreColor = LIGHT_WHITE;
    backColor = BLACK;
    clrScr();
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
            for(int i = 0; i < ((screenWidth * (screenHeight - 1)) * 2); i++){
                *(screenRam + i) = *(screenRam + i + screenWidth * 2);
            }
            for(int i = ((screenWidth * (screenHeight - 1)) * 2); i < ((screenWidth * screenHeight) * 2); i += 2){
               //*(screenRam + i) = ' ';
            }
            moveCsr(0, screenHeight - 1);
}

void print(char inp){
    switch (inp)
    {
    case '\n':
        if(((currentCursorLoc / screenWidth) + 1) >= screenHeight){
            scrollScreen();
        }else{
            moveCsr(0, (currentCursorLoc / screenWidth) + 1);
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
        //*(screenRam + currentCursorLoc * 2) = inp;
        //*((screenRam + currentCursorLoc * 2) + 1) = foreColor + (backColor << 4);
        csrInc();
        break;
    }
}

void moveCsr(int col, int row){
    currentCursorLoc = col + (row * screenWidth);
    outb(0x3D4, 0xf);
    outb(0x3D5, (unsigned char)(currentCursorLoc & 0xff));
    outb(0x3D4, 0xe);
    outb(0x3D5, (unsigned char)((currentCursorLoc >> 8) & 0xff));
}

void csrInc(){
    currentCursorLoc++;

    if(currentCursorLoc >= screenWidth * (screenHeight)){
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

void setForeColor(char color){
    foreColor = color;
}

void setBackColor(char color){
    backColor = color;
}

void setColor(int col, int row, char fgC = -1, char bgC = -1){
    if (fgC == -1){
        fgC = foreColor;
    }
    if(bgC == -1){
        bgC = backColor;
    }

    //*((screenRam + (col + (row * screenWidth)) * 2) + 1) = fgC + (bgC << 4);

}

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