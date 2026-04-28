#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <cstdint>
#include "../StdLib/vector.h"
#include "../Graphics/VGA.h"
#include "../StdLib/Nstring.h"

#define NULL 0

class FileSystem{
    public:
        union FileDate{
            void* data;
            FileSystem* link;
            FileSystem* dirListHead;
        } data;
        uint64_t size;
        char* name;
        enum Type{DIR, FILE, LINK} type;

        FileSystem* nextFile;
        FileSystem* prevFile;
        FileSystem* parentDir;

        Vector<char*>* getFilePath(){
            Vector<char*>* filePath = new Vector<char*>;

            filePath->push(name);
            FileSystem* currentDir = parentDir;
            printHex((uint64_t)(parentDir));
            
            while(currentDir != NULL){
                print("Pushing\n");
                filePath->push(currentDir->name);
                currentDir = currentDir->parentDir;
                print("Pushed\n");
            }
            return filePath;
        }

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
            print(file->name);
            printHex((uint64_t)file->parentDir);
            print('\n');
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

        FileSystem* getFile(char* name){
            FileSystem* currentFile = data.dirListHead;

            while(currentFile != NULL){
                if(strcmpd(name, currentFile->name)){
                    if(currentFile->type != DIR){
                        return 0;
                    }
                    return currentFile;
                }
                currentFile = currentFile->nextFile;
            }
            return 0;
        }
};

class File : public FileSystem{
    public:
        File(char* fileName, uint64_t fileSize = 0, void* fileData = NULL){
            type = FILE;
            name = fileName;
            size = fileSize;
            data.data = fileData;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = NULL;
        }
};

void printFilePath(FileSystem* file);
FileSystem* getFile(char* name, FileSystem* parentDirectory);

#endif