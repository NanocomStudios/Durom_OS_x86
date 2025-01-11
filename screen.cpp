#include "screen.h"
char* screenRam;
int currentRow;
int currentCol;

void clrScr(){
    moveCsr(0,0);
    for(currentRow = 0; currentRow < screenHeight; currentRow++){
        for(currentCol = 0; currentCol < screenWidth; currentCol++){
            *(screenRam + currentCol + (currentRow * screenWidth)) = ' ';
        }
    }
    moveCsr(0,0);
}

void initScreen(){
    screenRam = (char*)(0xb8000);
    moveCsr(0,0);
}

void print(const char* inp){
    for(int i = 0; *(inp + i) != 0; i++){
        *(screenRam + i * 2) = *(inp + i);//65 + i;
    }
}

void printChar(char inp){
    *(screenRam + (currentCol + (currentRow * screenWidth)) * 2) = inp;
}

void moveCsr(int x, int y){
    currentRow = y;
    currentCol = x;
}