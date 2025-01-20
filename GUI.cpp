#include "GUI.h"
#include "malloc.h"

Window* windowListHead;

Window* getLastWindow(){
    if(windowListHead == 0){
        return 0;
    }else{
        Window* tmp = windowListHead;
        while(tmp->next != 0){
            tmp = tmp->next;
        }
        return tmp;
    }
}

Window* openWindow(short w_x = 0, short w_y = 0){

    Window* newWindow = (Window*)malloc(sizeof(Window));

    if(newWindow == 0){
        return 0;
    }

    newWindow->x = w_x;
    newWindow->y = w_y;
    newWindow->status = 1;
    newWindow->childList = 0;
    newWindow->next = 0;

    Window* lastWindow = getLastWindow();

    if(!lastWindow){
        newWindow->id = lastWindow->id + 1;
        lastWindow->next = newWindow;
    }else{
        windowListHead = newWindow;
    }

    return newWindow;
    
}

void closeWindow(Window* inp){
    if(inp->next > 0){
        
    }
}