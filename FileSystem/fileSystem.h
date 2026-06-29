#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <cstdint>
#include "../StdLib/vector.h"
#include "../Graphics/VGA.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/stdio.h"

#define NULL 0

class FileSystem{
    public:
        FileSystem* nextFile;
        FileSystem* prevFile;
        FileSystem* parentDir;

        union FileDate{
            void* data;
            FileSystem* link;
            FileSystem* dirListHead;
        } data;
        uint64_t size;
        char* name;
        enum Type{DIR, FILE, LINK} type;

        

        // Vector<char*>* getFilePath(){
        //     Vector<char*>* filePath = new Vector<char*>;

        //     filePath->push(name);
        //     FileSystem* currentDir = parentDir;
        //     printHex((uint64_t)(parentDir));
            
        //     while(currentDir != NULL){
        //         print("Pushing\n");
        //         filePath->push(currentDir->name);
        //         currentDir = currentDir->parentDir;
        //         print("Pushed\n");
        //     }
        //     return filePath;
        // }

};

class Link : public FileSystem{
    public:
        Link(char* fileName, FileSystem* file){
            type = LINK;
            name = fileName;
            data.link = file;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = NULL;
        }
};

class File : public FileSystem{
    
    public:
        char isVirtual;

        File(char* fileName, uint64_t fileSize = 0, void* fileData = 0, char isFileVirtual = 0){
            type = FILE;
            name = fileName;
            size = fileSize;
            data.data = fileData;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = NULL;
            isVirtual = isFileVirtual;
        }
};

class Directory : public FileSystem{
    public:
        Directory(char* fileName){
            type = DIR;
            size = 0;
            name = fileName;
            data.dirListHead = NULL;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = this;
            addFile(new Link(".", this));
        }

        void addFile(FileSystem* file){
            FileSystem* currentFile = data.dirListHead;

            if(currentFile == NULL){
                data.dirListHead = file;
                file->parentDir = this;
                if(file->type == DIR){
                    Directory* dirFile = (Directory*)file;
                    dirFile->addFile(new Link("..", file->parentDir));
                }
                return;
            }
            while(currentFile->nextFile != NULL){
                currentFile = currentFile->nextFile;
            }

            currentFile->nextFile = file;
            file->prevFile = currentFile;
            file->parentDir = this;
            // print(file->name);
            // printHex((uint64_t)file->parentDir);
            // print('\n');
            if(file->type == DIR){
                Directory* dirFile = (Directory*)file;
                dirFile->addFile(new Link("..", file->parentDir));
            }
        }

        Vector<char*>* getDirectoryList(){
            FileSystem* currentFile = data.dirListHead;

            Vector<char*>* fileNameList = new Vector<char*>;

            while(currentFile != NULL){
                fileNameList->push(currentFile->name);
                currentFile = currentFile->nextFile;
            }

            return fileNameList;
        }

        FileSystem* getFSEntry(char* name){
            FileSystem* currentFile = data.dirListHead;

            while(currentFile != NULL){
                if(strcmpd(name, currentFile->name)){
                    return currentFile;
                }
                currentFile = currentFile->nextFile;
            }
            return 0;
        }

        File* getFile(char* name){
            FileSystem* file = getFSEntry(name);

            if(file == 0){
                return 0;
            }

            if(file->type == DIR){
                return 0;
            }else if(file->type == LINK){
                while(file->type == LINK && file->data.link != 0){
                    file = file->data.link;
                }
                if(file->type == FILE){
                    return (File*)file;
                }else{
                    return 0;
                }
            }else{
                return (File*)file;
            }
        }

        Directory* getDirectory(char* name){
            FileSystem* file = getFSEntry(name);

            if(file == 0){
                return 0;
            }

            if(file->type == FILE){
                return 0;
            }else if(file->type == LINK){
                while(file->type == LINK && file->data.link != 0){
                    file = file->data.link;
                }
                if(file->type == DIR){
                    return (Directory*)file;
                }else{
                    return 0;
                }
            }else{
                return (Directory*)file;
            }
        }

};

void printFilePath(Directory* file);
// FileSystem* getFile(char* name, FileSystem* parentDirectory);

#endif