#ifndef GUI
#define GUI

struct GraphicObject{
        short x, y, height, width;
        GraphicObject* next;

};

struct Window{
        short id, status, x, y;
        GraphicObject* childList;
        Window* next;

};

#endif