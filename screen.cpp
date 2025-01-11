#include "screen.h"
char* screenRam;
int currentCursorLoc;

void clrScr(){
    moveCsr(0,0);
    for(int row = 0; row < screenHeight; row++){
        for(int col = 0; col < screenWidth; col++){
            *(screenRam + col + (row * screenWidth)) = ' ';
        }
    }
    moveCsr(0,0);
}

void initScreen(){
    screenRam = (char*)(0xb8000);
    moveCsr(0,0);
}

void print(const char* inp){
    for(int i = 0;*(inp + i) != 0; i++){
        printChar(*(inp + i));
    }
}

void printChar(char inp){
    *(screenRam + currentCursorLoc * 2) = inp;
    currentCursorLoc++;
}

void moveCsr(int col, int row){
    currentCursorLoc = currentCursorLoc + col + (row * screenWidth);
}