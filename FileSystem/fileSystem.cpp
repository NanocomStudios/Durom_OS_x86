#include "fileSystem.h"
#include "../Graphics/VGA.h"
#include "../StdLib/vector.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/stdio.h"
#include "TAR.h"

#include <limine.h>

Directory* fs_root = 0;
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

namespace{
    __attribute__((used, section(".limine_requests")))
    volatile limine_module_request module_request = {
        .id = LIMINE_MODULE_REQUEST_ID,
        .revision = 0
    };
}

Directory* initFileSystem(){
    if(fs_root){
        return fs_root;
    }
    fs_root = new Directory("");

    if(module_request.response == NULL || module_request.response->module_count == 0){
        return fs_root;
    }

    Directory* data = new Directory("data");

    int module_count = module_request.response->module_count;
    printf("File System: %d modules found\n",module_count);

    for(int i = 0; i < module_count; i++){
        limine_file* fileInfo = module_request.response->modules[i];
        printf("Module [%d]:\n Base address = %x\n File size = %d\n Module String=%s\n",i,fileInfo->address, fileInfo->size, fileInfo->string);

        TAR_Header* file = (TAR_Header*)(fileInfo->address);

        int x = 0;
        while(file->file_name[0] != 0 && x < 20){
            uint64_t fileSize = asciiOctToInt(file->size, 12);
            printf("%c: %s : %d bytes\n", file->typeflag, file->file_name, fileSize);

            uint64_t nextFile = (uint64_t)file + ((fileSize / 512) + 1) * 512;

            if(fileSize % 512){
                nextFile += 512;
            }

            file = (TAR_Header*)(nextFile);
            x++;

        }

    }

    fs_root->addFile(data);
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


