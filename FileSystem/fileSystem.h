#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <cstdint>
#include "../StdLib/vector.h"
#include "../Graphics/VGA.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/stdio.h"
#include "../StdLib/lock.h"
#include "../StdLib/malloc.h"

#define NULL 0

#define FS_DIR 0
#define FS_FILE 1
#define FS_LINK 2

extern "C"{
    void *memcpy(void *__restrict dest, const void *__restrict src, std::size_t n);
}

class FileSystem;

union FileData{
    void* data;
    FileSystem* link;
    FileSystem* dirListHead;
};

class [[gnu::packed]] FileSystem{
    public:
        FileData data;
        uint64_t size;
        char* name;
        char type;
        
        FileSystem* nextFile;
        FileSystem* prevFile;
        FileSystem* parentDir;

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
            type = FS_LINK;

            uint64_t fileNameLength = 1;
            char c = fileName[0];
            while(c > 0){
                c = fileName[fileNameLength];
                fileNameLength++;
            }

            name = (char*)malloc(fileNameLength);
            memcpy(name, fileName, fileNameLength);

            // name = fileName;
            data.link = file;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = NULL;
            
        }

        ~Link(){
            free(name);
        }
};

class [[gnu::packed]] File : public FileSystem{
    public:
        char isMemoryMapped;
        Spinlock* mutex;
        Spinlock* writer_lock;
        uint64_t reader_count;

        File(char* fileName, uint64_t fileSize = 0, void* fileData = 0, char isFileMemoryMapped = 0){
            type = FS_FILE;
            
            uint64_t fileNameLength = 1;
            char c = fileName[0];
            while(c > 0){
                c = fileName[fileNameLength];
                fileNameLength++;
            }

            name = (char*)malloc(fileNameLength);
            memcpy(name, fileName, fileNameLength);

            //name = fileName;
            size = fileSize;
            data.data = fileData;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = NULL;
            isMemoryMapped = isFileMemoryMapped;
            reader_count = 0;
            mutex = new Spinlock;
            writer_lock = new Spinlock;
        }

        ~File(){
            free(name);
            delete mutex;
            delete writer_lock;
        }

        uint64_t read(void* buffer, uint64_t length, uint64_t skip = 0){
            uint64_t read_length = 0;

            mutex->acquire();
            reader_count++;
            if(reader_count == 1){
                writer_lock->acquire();
            }
            mutex->release();
            for(read_length = 0; (read_length < length) && (read_length < (size - skip)); read_length++){
                ((char*)buffer)[read_length] = ((char*)(data.data))[read_length + skip];
            }

            mutex->acquire();
            reader_count --;
            if(reader_count == 0){
                writer_lock->release();
            }
            mutex->release();

            return read_length;
        }

        uint64_t write(void* buffer, uint64_t length, uint64_t skip = 0){
            uint64_t write_length = 0;
            writer_lock->acquire();

            if(isMemoryMapped == 1){
                for(write_length = 0; ((write_length < length) && (write_length < (size - skip))); write_length++){
                    ((char*)(data.data))[write_length + skip] = ((char*)buffer)[write_length];
                }
            }
            
            writer_lock->release();
            return write_length;
        }
};

class [[gnu::packed]] Directory : public FileSystem{
    public:
        char isVirtual;
        
        Directory(char* fileName){
            type = FS_DIR;
            size = 0;

            uint64_t fileNameLength = 1;
            char c = fileName[0];
            while(c > 0){
                c = fileName[fileNameLength];
                fileNameLength++;
            }

            name = (char*)malloc(fileNameLength);
            memcpy(name, fileName, fileNameLength);

            // name = fileName;
            data.dirListHead = NULL;
            nextFile = NULL;
            prevFile = NULL;
            parentDir = this;
            addFile(new Link(".", this));
        }
        ~Directory(){
            free(name);
        }

        void addFile(FileSystem* file){
            FileSystem* currentFile = data.dirListHead;

            if(currentFile == NULL){
                data.dirListHead = file;
                file->parentDir = this;
                if(file->type == FS_DIR){
                    Directory* dirFile = static_cast<Directory*>(file);
                    dirFile->addFile(static_cast<FileSystem*>(new Link("..", file->parentDir)));
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
            if(file->type == FS_DIR){
                Directory* dirFile = static_cast<Directory*>(file);
                dirFile->addFile(static_cast<FileSystem*>(new Link("..", file->parentDir)));
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

            if(file->type == FS_DIR){
                return 0;
            }else if(file->type == FS_LINK){
                while(file->type == FS_LINK && file->data.link != 0){
                    file = file->data.link;
                }
                if(file->type == FS_FILE){
                    return static_cast<File*>(file);
                }else{
                    return 0;
                }
            }else{
                return static_cast<File*>(file);
            }
        }

        Directory* getDirectory(char* name){
            FileSystem* file = getFSEntry(name);

            if(file == 0){
                return 0;
            }

            if(file->type == FS_FILE){
                return 0;
            }else if(file->type == FS_LINK){
                while(file->type == FS_LINK && file->data.link != 0){
                    file = file->data.link;
                }
                if(file->type == FS_DIR){
                    return static_cast<Directory*>(file);
                }else{
                    return 0;
                }
            }else{
                return static_cast<Directory*>(file);
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