#include "screen.h"
#include "malloc.h"

char* screenRam;
int currentCursorLoc;

void clrScr(){
    moveCsr(0,0);
    for(int row = 0; row < screenHeight; row++){
        for(int col = 0; col < screenWidth; col++){
            *(screenRam + (col + (row * screenWidth)) * 2) = ' ';
        }
    }
    moveCsr(0,0);
}

void initScreen(){
    screenRam = (char*)(0xb8000);
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

void print(char inp){
    switch (inp)
    {
    case '\n':
        moveCsr(0, (currentCursorLoc / screenWidth) + 1);
        break;
    
    default:
        *(screenRam + currentCursorLoc * 2) = inp;
        currentCursorLoc++;
        break;
    }
}

void moveCsr(int col, int row){
    currentCursorLoc = col + (row * screenWidth);
}