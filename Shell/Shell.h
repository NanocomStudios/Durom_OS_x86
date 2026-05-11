#ifndef SHELL_H
#define SHELL_H

#define SHELL_MAX_INPUT_LENGTH 256

#include "../StdLib/vector.h"

class Token{
    public :
        Vector<char> lexem;
        Token* nextToken;

        Token(){
            nextToken = 0;
        }
};

void shell();

#endif