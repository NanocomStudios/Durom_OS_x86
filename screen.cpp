#include "screen.h"
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
    int length = 0;
    if(inp < 0){
        print('-');
        inp *= -1;
    }
    do{
        print((inp % 10) + 0x30);
        inp = inp / 10;
        length ++;
    }while(inp > 0);
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