#ifndef GUI
#define GUI

#include "VGA.h"

#define BOX 1
#define TEXT 2

struct GraphicObject{
        short x, y;
        GraphicObject* next;
        void* Object;
        char type;

};

struct Window{
        short height, width, x, y;
        GraphicObject* childList;
        Window* next;
        Window* prev;
        char status;
};

struct Box{
        short height, width;
        Color borderColor;
        Color fillColor;
};

struct Text{
        char* text;
        Color color;
};

Window* getLastWindow();
Window* openWindow(short w_x, short w_y, short w_width, short w_height);
void closeWindow(Window* inp);
void initGUI();
void drawWindows();
void bringWindowFront(Window* inp);

#endif