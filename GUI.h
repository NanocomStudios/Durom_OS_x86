#ifndef GUI
#define GUI

struct Window{
    short x,y,height,width;
    Window* child;
    Window* next;
    
};

#endif