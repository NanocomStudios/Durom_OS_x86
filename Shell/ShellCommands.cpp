#include "ShellCommands.h"
#include "../StdLib/stdio.h"
#include "../FileSystem/fileSystem.h"
#include "../StdLib/Nstring.h"
#include "../StdLib/vector.h"

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
        Directory* tmpDirectory = (Directory*)getDirectoryEntry(argv[1], *workingDirectory);
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
        if(currentFile->type == currentFile->FILE){
            printf("F :");
        }else if(currentFile->type == currentFile->DIR){
            printf("D :");
        }else if(currentFile->type == currentFile->LINK){
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