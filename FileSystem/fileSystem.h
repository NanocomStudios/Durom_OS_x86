#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <cstdint>
#include "../StdLib/vector.h"
#include "../Graphics/VGA.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/stdio.h"
#include "../StdLib/lock.h"

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
    private:
        Spinlock mutex;
        Spinlock writer_lock;
        uint64_t reader_count;
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
            reader_count = 0;
        }

        uint64_t read(char* buffer, uint64_t length, uint64_t skip = 0){
            uint64_t read_length = 0;

            mutex.acquire();
            // reader_count++;
            // if(reader_count == 1){
            //     writer_lock.acquire();
            // }
            mutex.release();

            for(read_length = 0; (read_length < length) && (read_length < (size - skip)); read_length++){
                buffer[read_length] = ((char*)(data.data))[read_length + skip];
            }

            mutex.acquire();
            // reader_count --;
            // if(reader_count == 0){
            //     writer_lock.release();
            // }
            mutex.release();

            return read_length;
        }

        uint64_t write(char* buffer, uint64_t length, uint64_t skip = 0){
            uint64_t write_length = 0;
            // writer_lock.acquire();

            if(isVirtual == 1){
                for(write_length = 0; ((write_length < length) && (write_length < (size + skip))); write_length++){
                    ((char*)(data.data))[write_length + skip] = buffer[write_length];
                }
            }
            
            // writer_lock.release();
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
Directory* initFileSystem();
Directory* getFSRoot();
// Directory** getWorkingDirectory();
// void setWorkingDirectory(Directory* dir);
Directory* getDirectoryEntry(char* input, Directory* workingDirectory);
File* getFileEntry(char* input, Directory* workingDirectory);

#endif