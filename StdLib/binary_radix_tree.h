#ifndef BINARY_RADIX_TREE_H
#define BINARY_RADIX_TREE_H

#include "rb_tree.h"

template <typename ValueType>
union TrieNode{
    RedBlackTree<char,  TrieNode<ValueType>>* child;
    ValueType value;
};

template <typename ValueType> 
class Trie{
    private:
    RedBlackTree<char, TrieNode<ValueType>> trieHead;

    public:
    void insert(char* key, ValueType value){
        
    }
};

#endif