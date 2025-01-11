#ifndef SCREEN
#define SCREEN

#define screenWidth 80
#define screenHeight 25

void clrScr();
void initScreen();
void print(const char* inp);
void moveCsr(int x, int y);
void printChar(char inp);

#endif