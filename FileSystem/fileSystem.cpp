#include "fileSystem.h"
#include "../Graphics/VGA.h"
#include "../StdLib/vector.h"
#include "../StdLib/Nstring.h"

void printFilePath(Directory* currentDir, Directory* parentDirGet){
    Vector<char*>* filePath = new Vector<char*>;

    Directory* parentDir = (Directory*)(currentDir->parentDir);

    printHex((uint64_t)parentDir);
    print(" : ");
    printHex((uint64_t)parentDirGet);
    print(" : ");
    printHex((uint64_t)((currentDir)));
    print('\n');

    filePath->push(currentDir->name);
    int pathCount = filePath->size();

    for(int i = pathCount - 1; i >= 0; i--){
        print((filePath->arr)[i]);
        print('/');
    }
}

