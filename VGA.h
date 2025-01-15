#ifndef SCREEN
#define SCREEN

#define screenWidth 80
#define screenHeight 25

#define BLACK 0x0
#define BLUE 0x1
#define GREEN 0x2
#define CYAN 0x3
#define RED 0x4
#define MAGENTA 0x5
#define BROWN 0x6
#define WHITE 0x7

#define GRAY 0x8
#define LIGHT_BLUE 0x9
#define LIGHT_GREEN 0xA
#define LIGHT_CYAN 0xB
#define LIGHT_RED 0xC
#define LIGHT_MAGENTA 0xD
#define LIGHT_BROWN 0xE
#define LIGHT_WHITE 0xF

void clrScr();
void initScreen();
void print(const char* inp);
void moveCsr(int col, int row);
void print(char inp);
void printInt(long inp);
void printHex(long inp);
int len(long inp);
int lenH(long inp);
char hexToAscii(char inp);
void csrInc();
void scrollScreen();
void csrDec();

#endif