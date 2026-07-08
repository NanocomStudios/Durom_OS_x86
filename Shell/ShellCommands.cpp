#include "ShellCommands.h"
#include "../StdLib/stdio.h"
#include "../FileSystem/fileSystem.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/vector.h"

#include "../IO/PCI.h"
#include "../Graphics/VGA.h"
#include "../StdLib/malloc.h"

void shell_do_nothing(int argc, char** argv, Directory** workingDirectory){
}

void shell_echo(int argc, char** argv, Directory** workingDirectory){
    if(argc < 2){
        printf("\n");
    }else{
        printf("%s\n", argv[1]);
    }
}

void shell_cd(int argc, char** argv, Directory** workingDirectory){
    if(argc < 2){
        *workingDirectory = getFSRoot();
        return;
    }else{
        if(argv[1][0] == 0){
            return;
        }
        Directory* tmpDirectory = static_cast<Directory*>(getDirectoryEntry(argv[1], *workingDirectory));
        if(!tmpDirectory){
            printf("\"%s\" directory not found!\n", argv[1]);
            return;
        }

        *workingDirectory = tmpDirectory;
    }
}

void shell_ls_print_list(Directory* workingDirectory, char file_info_flag){
    FileSystem* currentFile = workingDirectory->data.dirListHead;

    while(currentFile != NULL){
        if(currentFile->type == FS_FILE){
            printf("F :");
        }else if(currentFile->type == FS_DIR){
            printf("D :");
        }else if(currentFile->type == FS_LINK){
            printf("L :");
        }

        printf("%s",currentFile->name);

        if(file_info_flag){
            printf(" : %d\n",currentFile->size);
        }else{
            printf("\n");
        }
        currentFile = currentFile->nextFile;
    }
}

void shell_ls(int argc, char** argv, Directory** workingDirectory){
    Directory* dir = *workingDirectory;
    char file_info_flag = 0;

    if(argc == 2){
        if(strcmpd("-l", argv[1])){
            file_info_flag = 1;
        }else{
            dir = getDirectoryEntry(argv[1],*workingDirectory);
        }
        if(!dir){
            printf("\"%s\" directory not found!\n", argv[1]);
        }else{
            shell_ls_print_list(dir, file_info_flag);
        }
    }else if(argc > 2){
        for(int i = 1; i < argc; i++){
            if(strcmpd("-l", argv[i])){
                file_info_flag = 1;
            }else{
                dir = getDirectoryEntry(argv[i],*workingDirectory);
                if(!dir){
                    printf("\"%s\" directory not found!\n", argv[i]);
                }else{
                    printf("%s:\n",argv[i]);
                    shell_ls_print_list(dir, file_info_flag);
                }
            }
        }
    }else{
        shell_ls_print_list(dir, file_info_flag);
    }
}

void shell_pwd(int argc, char** argv, Directory** workingDirectory){
    printFilePath(*workingDirectory);
    printf("\n");
}

void shell_xxd(int argc, char** argv, Directory** workingDirectory){
    uint64_t skip = 0;
    char buffer[512];
    if(argc > 1){
        File* file = getFileEntry(argv[1], *workingDirectory);
        if(file){
            while(1){
                uint64_t len = file->read(buffer, 512, skip);
                hexdump(buffer, len);
                skip += len;
                if(len < 512){
                    break;
                }
            }
        }else{
            printf("\"%s\" file not found!\n", argv[1]);
        }
    }else{
        printf("Insufficiant argument count!\n");
    }
}

void shell_write(int argc, char** argv, Directory** workingDirectory){
    unsigned char buffer[] = {255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0};
    if(argc > 1){
        File* file = getFileEntry(argv[1], *workingDirectory);
        if(file){
            uint64_t len = file->write((char*)buffer, sizeof(buffer) / sizeof(char));
            printf("%d bytes written.\n",len);
        }else{
            printf("\"%s\" file not found!\n", argv[1]);
        }
    }else{
        printf("Insufficiant argument count!\n");
    }
}

void shell_pci(int argc, char** argv, Directory** workingDirectory){
    printPciList();
}

void shell_display(int argc, char** argv, Directory** workingDirectory){
    printDisplayInfo();
}

void shell_memory(int argc, char** argv, Directory** workingDirectory){
    printMemoryInfo();
}