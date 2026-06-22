#include "fileSystem.h"
#include "../Graphics/VGA.h"
#include "../StdLib/vector.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/stdio.h"

void printFilePath(Directory* currentDir){
    Vector<char*>* filePath = new Vector<char*>;
    // hexdump((char*)currentDir, sizeof(Directory));
    Directory* parentDir = (Directory*)(currentDir->parentDir);

    // printf("%p : %p : %s\n", (void*)(currentDir->parentDir),(void*)&(currentDir->parentDir), currentDir->name);
    // printHex((uint64_t)parentDir);
    // print(" : ");
    // printHex((uint64_t)parentDirGet);
    // print(" : ");
    // printHex((uint64_t)((currentDir)));
    // print('\n');

    while(parentDir != currentDir){
        filePath->push(currentDir->name);
        currentDir = parentDir;
        parentDir = (Directory*)(currentDir->parentDir);
    }
    if(filePath->size() == 0){
        printf("/");
    }else{
        int pathCount = filePath->size();
    
        for(int i = pathCount - 1; i >= 0; i--){
            printf("/%s",(filePath->arr)[i]);
        }
    }
}

