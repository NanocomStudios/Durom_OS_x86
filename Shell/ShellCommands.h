#ifndef SHELL_COMMANDS_H
#define SHELL_COMMANDS_H

#include "../FileSystem/fileSystem.h"

void shell_do_nothing(int argc, char** argv, Directory** workingDirectory);
void shell_echo(int argc, char** argv, Directory** workingDirectory);
void shell_cd(int argc, char** argv, Directory** workingDirectory);
void shell_ls(int argc, char** argv, Directory** workingDirectory);
void shell_pwd(int argc, char** argv, Directory** workingDirectory);
void shell_xxd(int argc, char** argv, Directory** workingDirectory);
void shell_write(int argc, char** argv, Directory** workingDirectory);

#endif