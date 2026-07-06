#ifndef BINARY_RADIX_TREE_H
#define BINARY_RADIX_TREE_H

#include "rb_tree.h"

// template <typename ValueType>
// union TrieNodeValue{
//     RedBlackTree<char,  TrieNode<ValueType>>* child;
//     ValueType value;
// };

template <typename ValueType>
struct TrieNode{
    char isLeaf;
    union TrieNodeValue{
        RedBlackTree<char,  TrieNode<ValueType>*>* tree;
        ValueType data;
    }value;
};

template <typename ValueType> 
class Trie{
    private:
    RedBlackTree<char, TrieNode<ValueType>*> trieHead;

    public:
    char insert(char* key, ValueType value){
        RedBlackTree<char, TrieNode<ValueType>*>* currentTree = &trieHead;
        TrieNode<ValueType>* currentNode = 0;

        uint64_t i = 0;
        
        while(currentTree != 0){
            currentNode = currentTree->search(key[i]);
            if(currentNode == 0){
                break;
            }
            if(currentNode->isLeaf == 1){
                return 0;
            }
            
            currentTree = currentNode->value.tree;
            i++;
        }

        while(key[i] > 0){
            TrieNode<ValueType>* trieNode = new TrieNode<ValueType>;
            trieNode->isLeaf = 0;
            trieNode->value.tree = new RedBlackTree<char,TrieNode<ValueType>*>;

            currentTree->insert(key[i], trieNode);
            currentTree = trieNode->value.tree;
            i++;
        }

        TrieNode<ValueType>* trieNode = new TrieNode<ValueType>;
        trieNode->isLeaf = 1;
        trieNode->value.data = value;

        currentTree->insert(key[i], trieNode);

        return 1;

    }

    ValueType search(char* key){
        RedBlackTree<char, TrieNode<ValueType>*>* currentTree = &trieHead;
        TrieNode<ValueType>* currentNode = 0;

        uint64_t i = 0;
        
        while(currentTree != 0){
            currentNode = currentTree->search(key[i]);
            if(currentNode == 0){
                return 0;
            }
            if(currentNode->isLeaf == 1 && key[i] == 0){
                return currentNode->value.data;
            }
            
            currentTree = currentNode->value.tree;
            i++;
        }
    }

    // void printTree(TrieNode<ValueType>* node = 0){
    //     if(node == 0){
    //         trieHead.ListTree(0,0,printTree,1);
    //     }
    //     if(node->isLeaf){
    //         return;
    //     }
        
    //     RedBlackTree<char, TrieNode<ValueType>*>* currentTree = node->value.tree;
    //     currentTree->ListTree(0,0,this->printTree, 1);
    // }
};

#endif