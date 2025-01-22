#ifndef GUI
#define GUI

#include "VGA.h"

#define BOX 1
#define TEXT 2

class GraphicObject{ 
        public:
        short x, y;
        GraphicObject* next;
        void* Object;
        short id;
        char type;


};

class Window{
        public:
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
GraphicObject* getGraphicObject(Window* window, short id);
Window* openWindow(short w_x, short w_y, short w_width, short w_height);
void closeWindow(Window* inp);
void initGUI();
void drawWindows();
void bringWindowFront(Window* inp);

#endif