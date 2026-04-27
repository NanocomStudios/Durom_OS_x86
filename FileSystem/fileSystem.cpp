#include "fileSystem.h"
#include "../Graphics/VGA.h"
#include "../StdLib/vector.h"

void printFilePath(FileSystem* file){
    Vector<char*>* filePath = file->getFilePath();
    int pathCount = filePath->size();

    for(int i = pathCount - 1; i >= 0; i--){
        print((filePath->arr)[i]);
        print('/');
    }
}