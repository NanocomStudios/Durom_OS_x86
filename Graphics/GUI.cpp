#include "GUI.h"
#include "malloc.h"

Window* windowListHead;
Color borderColor;
Color fillColor;

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

GraphicObject* getGraphicObject(Window* window, short id){
    GraphicObject* tmp = window->childList;

    while((tmp->next != 0) && (tmp->id != id)){
        tmp = tmp->next;
    }

    if(tmp->id == id){
        return tmp;
    }else{
        return 0;
    }

}

Window* openWindow(short w_x, short w_y, short w_height, short w_width){

    Window* newWindow = (Window*)malloc(sizeof(Window));
    
    if(newWindow == 0){
        return 0;
    }

    newWindow->x = w_x;
    newWindow->y = w_y;
    newWindow->height = w_height;
    newWindow->width = w_width;
    newWindow->status = 1;
    newWindow->next = 0;

    Window* lastWindow = getLastWindow();

    if((unsigned int)(lastWindow) != 0){
        lastWindow->next = newWindow;
        newWindow->prev = lastWindow;
    }else{
        windowListHead = newWindow;
        newWindow->prev = 0;
    }

    GraphicObject* baseUI = (GraphicObject*)malloc(sizeof(GraphicObject));
    baseUI->id = 0;
    baseUI->x = 0;
    baseUI->y = 0;
    baseUI->next = 0;

    newWindow->childList = baseUI;

    Box* windowBG = (Box*)malloc(sizeof(Box));

    windowBG->width = w_width;
    windowBG->height = w_height;
    windowBG->borderColor = borderColor;
    windowBG->fillColor = fillColor;

    baseUI->Object = windowBG;
    baseUI->type = BOX;

    return newWindow;
    
}

void closeWindow(Window* inp){
    if((unsigned int)inp->next > 0){
        inp->next->prev = inp->prev;
    }
    if((unsigned int)inp->prev > 0){
        inp->prev->next = inp->next;
    } 
    if(windowListHead == inp){
        windowListHead = inp->next;
    }
    free(inp);
}

void initGUI(){
    windowListHead = 0;
    borderColor = {0,0,255};
    fillColor = {0,255,255};
}

void drawWindows(){
    Window* tmpW = windowListHead;

    while(tmpW != 0){
        GraphicObject* tmpG = tmpW->childList;
        
        while(tmpG != 0){

            if(tmpG->type == BOX){
                    Box* tmpO = (Box*)tmpG->Object;
                    drawRectangle(
                        tmpW->x + tmpG->x,\
                        tmpW->y + tmpG->y,\
                        tmpW->x + tmpG->x + tmpO->width,\
                        tmpW->y + tmpG->y + tmpO->height,\
                        tmpO->borderColor\
                    );
                    fillRectangle(
                        tmpW->x + tmpG->x + 1,\
                        tmpW->y + tmpG->y + 1,\
                        tmpW->x + tmpG->x + tmpO->width - 1,\
                        tmpW->y + tmpG->y + tmpO->height - 1,\
                        tmpO->fillColor\
                    );
            }

            tmpG = tmpG->next;
        }
        tmpW = tmpW->next;

    }
    print("Drawing Complete\n");

}

void bringWindowFront(Window* inp){
    Window* tmp = getLastWindow();
    
    if((unsigned int)(inp->next) > 0){
        inp->next->prev = inp->prev;
    }
    if((unsigned int)(inp->prev) > 0){
        inp->prev->next = inp->next;
    } 
    if(windowListHead == inp){
        windowListHead = inp->next;
    }

    tmp->next = inp;
    inp->prev = tmp;
    inp->next = 0;

}