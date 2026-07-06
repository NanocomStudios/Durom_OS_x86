#include "ShellCommands.h"
#include "../StdLib/stdio.h"

void shell_do_nothing(int argc, char** argv){

}

void shell_echo(int argc, char** argv){
    if(argc < 2){
        printf("\n");
    }else{
        printf("%s\n", argv[1]);
    }
}