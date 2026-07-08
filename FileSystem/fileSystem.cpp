#include "fileSystem.h"
#include "../Graphics/VGA.h"
#include "../StdLib/vector.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/stdio.h"

Directory* fs_root;
// Directory* workingDirectory;

void printFilePath(Directory* currentDir){
    Vector<char*>* filePath = new Vector<char*>;
    // hexdump((char*)currentDir, sizeof(Directory));
    Directory* parentDir = static_cast<Directory*>(currentDir->parentDir);

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
        parentDir = static_cast<Directory*>(currentDir->parentDir);
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

Directory* initFileSystem(){
    fs_root = new Directory("");
    return fs_root;
}

Directory* getFSRoot(){
    return fs_root;
}

Directory* getDirectoryEntry(char* input, Directory* workingDirectory){

    Vector<Vector<char>*>* tokenList = tokenize(input, '/');

    Directory* tmpDirectory = workingDirectory;

    if(input[0] == '/'){
        tmpDirectory = getFSRoot();
    }

    char invalid = 0;

    for(uint64_t i = 0; i < tokenList->size(); i++){
        if(!invalid){
            if(tokenList->arr[i]->arr[0] != 0){
                tmpDirectory = tmpDirectory->getDirectory(tokenList->arr[i]->arr);
                    if(!tmpDirectory){
                        invalid = 1; // to continue deleting the token list
                    }
            }
        }
        delete tokenList->arr[i];
    }
    delete tokenList;
    if(!invalid){
        return tmpDirectory;
    }else{
        return 0;
    }
}

File* getFileEntry(char* input, Directory* workingDirectory){

    Vector<Vector<char>*>* tokenList = tokenize(input, '/');

    Directory* tmpDirectory = workingDirectory;

    if(input[0] == '/'){
        tmpDirectory = getFSRoot();
    }

    char invalid = 0;
    uint64_t i = 0;

    for(; i < tokenList->size() - 1; i++){
        if(!invalid){
            if(tokenList->arr[i]->arr[0] != 0){
                tmpDirectory = tmpDirectory->getDirectory(tokenList->arr[i]->arr);
                    if(!tmpDirectory){
                        invalid = 1; // to continue deleting the token list
                    }
            }
        }
        delete tokenList->arr[i];
    }
    if(!invalid){
        File* tmpFile = tmpDirectory->getFile(tokenList->arr[i]->arr);
        delete tokenList;
        return tmpFile;
    }else{
        delete tokenList;
        return 0;
    }

}

// Directory** getWorkingDirectory(){
//     return &workingDirectory;
// }


