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
        RedBlackTree<char,  TrieNode<ValueType>>* tree;
        ValueType data;
    }value;
};

template <typename ValueType> 
class Trie{
    private:
    RedBlackTree<char, TrieNode<ValueType>> trieHead;

    public:
    char insert(char* key, ValueType value){
        RedBlackTree<char, TrieNode<ValueType>>* currentTree = &trieHead;
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
            i++
        }
};

#endif