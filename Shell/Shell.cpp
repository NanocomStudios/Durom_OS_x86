#include "Shell.h"

#include "../StdLib/malloc.h"

#include "../HID/keyboard.h"

#include "../StdLib/stdio.h"
#include "../StdLib/Nstring.h"

#include "../StdLib/binary_radix_tree.h"
#include "../FileSystem/fileSystem.h"

#include <cstdint>

// Token* getTokenList(char* input){
//     Token* tokenHead = new Token;
//     // printf("tokenHeadPtr: %p\n",(uint64_t)tokenHead);
//     Token* currentToken = tokenHead;

//     char inp = input[0];
//     char blockMode = 0;
//     char ignorNext = 0;
//     int inputPointer = 0;

//     while(inp != 0){
//         if(ignorNext){
//             currentToken->lexem.push(inp);
//             ignorNext = 0;
//         }else{
//             switch(inp){
//                 case ' ':
//                     if(blockMode){
//                         currentToken->lexem.push(inp);
//                     }else{
//                         if((currentToken->lexem.size() > 0)){
//                             currentToken->lexem.push(0);
//                             currentToken->nextToken = new Token;
//                             currentToken = currentToken->nextToken;
//                             currentToken->nextToken = 0;
//                         }
//                     }
//                     break;
//                 case '\"':
//                     if((currentToken->lexem.size() > 0)){
//                         currentToken->lexem.push(0);
//                         currentToken->nextToken = new Token;
//                         currentToken = currentToken->nextToken;
//                         currentToken->nextToken = 0;
//                     }
//                     blockMode = (blockMode == 0) ? 1: 0;
//                     break;
//                 case '\\':
//                     ignorNext = 1;
//                     break;
//                 default:
//                     currentToken->lexem.push(inp);
                
//             }
//         }
//         inputPointer++;
//         inp = input[inputPointer];
//     }
//     currentToken->lexem.push(0);
//     return tokenHead;

// }

void shell(){
    Directory* fs_rot = getFSRoot();
    Directory* workingDirectory = fs_rot;

    printFilePath(workingDirectory);
    printf(">");
    char input[SHELL_MAX_INPUT_LENGTH];
    int inputPointer = 0;

    char inp;

    while(inputPointer < SHELL_MAX_INPUT_LENGTH){
        if(inputPointer == (SHELL_MAX_INPUT_LENGTH - 1)){
            input[inputPointer] = 0;
            break;
        }

        inp = getChar();
        if(inp == '\n'){
            printf("\n");
            input[inputPointer] = 0;
            break;
        }else if(inp == '\b'){
            if(inputPointer > 0){
                printf("\b");
                inputPointer--;
            }
        }else{
            printf("%c", inp);
            input[inputPointer] = inp;
            inputPointer++;
        }
    }

    // Token* tokenHead = getTokenList(input);

    // Token* currentToken = tokenHead;
    // Token* temp;

    // while(currentToken != 0){
    //     printf("%s\n", currentToken->lexem.arr);
    //     temp = currentToken->nextToken;
    //     delete currentToken;
    //     currentToken = temp;
    // }

    Vector<Vector<char>*>* tokenList = tokenize(input, ' ');
    
    printf("%d\n", (tokenList->arr[0])->arr[0]);
    if(input[0] == '.' || input[0] == '/'){
        // Execute file
    }else{
        //Shell command
        

    }

    
    // for(int i = 0; i < tokenList->size(); i++){
    //     printf("%s\n", (tokenList->arr[i])->arr);
    //     delete tokenList->arr[i];
    // }
    // delete tokenList;
}