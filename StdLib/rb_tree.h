#ifndef RB_TREE_H
#define RB_TREE_H

#include "cppstd.h"

//https://www.geeksforgeeks.org/cpp/red-black-tree-in-cpp/

// Enumeration for colors of nodes in Red-Black Tree
enum NodeColor { TREE_NODE_RED, TREE_NODE_BLACK };

// Class template for Red-Black Tree
template <typename KeyType, typename ValueType> 
class RedBlackTree {
private:
    // Structure for a node in Red-Black Tree
    struct Node {
        KeyType key_data;
        ValueType value_data;
        NodeColor color;
        Node* parent;
        Node* left;
        Node* right;

        // Constructor to initialize node with key_data and
        // color
        Node(KeyType key, ValueType val)
            : key_data(key)
            , value_data(val)
            , color(TREE_NODE_RED)
            , parent(nullptr)
            , left(nullptr)
            , right(nullptr)
        {
        }
    };

    Node* root; // Root of the Red-Black Tree

    // Utility function: Left Rotation
    void rotateLeft(Node*& node)
    {
        Node* child = node->right;
        node->right = child->left;
        if (node->right != nullptr)
            node->right->parent = node;
        child->parent = node->parent;
        if (node->parent == nullptr)
            root = child;
        else if (node == node->parent->left)
            node->parent->left = child;
        else
            node->parent->right = child;
        child->left = node;
        node->parent = child;
    }

    // Utility function: Right Rotation
    void rotateRight(Node*& node)
    {
        Node* child = node->left;
        node->left = child->right;
        if (node->left != nullptr)
            node->left->parent = node;
        child->parent = node->parent;
        if (node->parent == nullptr)
            root = child;
        else if (node == node->parent->left)
            node->parent->left = child;
        else
            node->parent->right = child;
        child->right = node;
        node->parent = child;
    }

    // Utility function: Fixing Insertion Violation
    void fixInsert(Node*& node)
    {
        Node* parent = nullptr;
        Node* grandparent = nullptr;
        while (node != root && node->color == TREE_NODE_RED
               && node->parent->color == TREE_NODE_RED) {
            parent = node->parent;
            grandparent = parent->parent;
            if (parent == grandparent->left) {
                Node* uncle = grandparent->right;
                if (uncle != nullptr
                    && uncle->color == TREE_NODE_RED) {
                    grandparent->color = TREE_NODE_RED;
                    parent->color = TREE_NODE_BLACK;
                    uncle->color = TREE_NODE_BLACK;
                    node = grandparent;
                }
                else {
                    if (node == parent->right) {
                        rotateLeft(parent);
                        node = parent;
                        parent = node->parent;
                    }
                    rotateRight(grandparent);
                    swap(parent->color, grandparent->color);
                    node = parent;
                }
            }
            else {
                Node* uncle = grandparent->left;
                if (uncle != nullptr
                    && uncle->color == TREE_NODE_RED) {
                    grandparent->color = TREE_NODE_RED;
                    parent->color = TREE_NODE_BLACK;
                    uncle->color = TREE_NODE_BLACK;
                    node = grandparent;
                }
                else {
                    if (node == parent->left) {
                        rotateRight(parent);
                        node = parent;
                        parent = node->parent;
                    }
                    rotateLeft(grandparent);
                    swap(parent->color, grandparent->color);
                    node = parent;
                }
            }
        }
        root->color = TREE_NODE_BLACK;
    }

    // Utility function: Fixing Deletion Violation
    void fixDelete(Node*& node)
    {
        while (node != root && node->color == TREE_NODE_BLACK) {
            if (node == node->parent->left) {
                Node* sibling = node->parent->right;
                if (sibling->color == TREE_NODE_RED) {
                    sibling->color = TREE_NODE_BLACK;
                    node->parent->color = TREE_NODE_RED;
                    rotateLeft(node->parent);
                    sibling = node->parent->right;
                }
                if ((sibling->left == nullptr
                     || sibling->left->color == TREE_NODE_BLACK)
                    && (sibling->right == nullptr
                        || sibling->right->color
                               == TREE_NODE_BLACK)) {
                    sibling->color = TREE_NODE_RED;
                    node = node->parent;
                }
                else {
                    if (sibling->right == nullptr
                        || sibling->right->color == TREE_NODE_BLACK) {
                        if (sibling->left != nullptr)
                            sibling->left->color = TREE_NODE_BLACK;
                        sibling->color = TREE_NODE_RED;
                        rotateRight(sibling);
                        sibling = node->parent->right;
                    }
                    sibling->color = node->parent->color;
                    node->parent->color = TREE_NODE_BLACK;
                    if (sibling->right != nullptr)
                        sibling->right->color = TREE_NODE_BLACK;
                    rotateLeft(node->parent);
                    node = root;
                }
            }
            else {
                Node* sibling = node->parent->left;
                if (sibling->color == TREE_NODE_RED) {
                    sibling->color = TREE_NODE_BLACK;
                    node->parent->color = TREE_NODE_RED;
                    rotateRight(node->parent);
                    sibling = node->parent->left;
                }
                if ((sibling->left == nullptr
                     || sibling->left->color == TREE_NODE_BLACK)
                    && (sibling->right == nullptr
                        || sibling->right->color
                               == TREE_NODE_BLACK)) {
                    sibling->color = TREE_NODE_RED;
                    node = node->parent;
                }
                else {
                    if (sibling->left == nullptr
                        || sibling->left->color == TREE_NODE_BLACK) {
                        if (sibling->right != nullptr)
                            sibling->right->color = TREE_NODE_BLACK;
                        sibling->color = TREE_NODE_RED;
                        rotateLeft(sibling);
                        sibling = node->parent->left;
                    }
                    sibling->color = node->parent->color;
                    node->parent->color = TREE_NODE_BLACK;
                    if (sibling->left != nullptr)
                        sibling->left->color = TREE_NODE_BLACK;
                    rotateRight(node->parent);
                    node = root;
                }
            }
        }
        node->color = TREE_NODE_BLACK;
    }

    // Utility function: Find Node with Minimum Value
    Node* minValueNode(Node*& node)
    {
        Node* current = node;
        while (current->left != nullptr)
            current = current->left;
        return current;
    }

    // Utility function: Find Node with Maximum Value
    Node* maxValueNode(Node*& node)
    {
        Node* current = node;
        while (current->right != nullptr)
            current = current->right;
        return current;
    }

    // Utility function: Transplant nodes in Red-Black Tree
    void transplant(Node*& root, Node*& u, Node*& v)
    {
        if (u->parent == nullptr)
            root = v;
        else if (u == u->parent->left)
            u->parent->left = v;
        else
            u->parent->right = v;
        if (v != nullptr)
            v->parent = u->parent;
    }

    // Utility function: Delete all nodes in the Red-Black
    // Tree
    void deleteTree(Node* node)
    {
        if (node != nullptr) {
            deleteTree(node->left);
            deleteTree(node->right);
            delete node;
        }
    }

public:
    // Constructor: Initialize Red-Black Tree
    RedBlackTree()
        : root(nullptr)
    {
    }

    // Destructor: Delete Red-Black Tree
    ~RedBlackTree() { deleteTree(root); }


    Node* getMin(){
        return minValueNode(root);
    }

    Node* getMax(){
        return maxValueNode(root);
    }

    // Public function: Insert a value_data into Red-Black Tree
    void insert(KeyType key, ValueType value_data)
    {
        Node* node = new Node(key, value_data);
        Node* parent = nullptr;
        Node* current = root;
        while (current != nullptr) {
            parent = current;
            if (node->key_data < current->key_data)
                current = current->left;
            else
                current = current->right;
        }
        node->parent = parent;
        if (parent == nullptr)
            root = node;
        else if (node->key_data < parent->key_data)
            parent->left = node;
        else
            parent->right = node;
        fixInsert(node);
    }

    // Public function: Remove a value_data from Red-Black Tree
    void remove(KeyType key)
    {
        Node* node = root;
        Node* z = nullptr;
        Node* x = nullptr;
        Node* y = nullptr;
        while (node != nullptr) {
            if (node->key_data == key) {
                z = node;
            }

            if (node->key_data <= key) {
                node = node->right;
            }
            else {
                node = node->left;
            }
        }

        if (z == nullptr) {
            return;
        }

        y = z;
        NodeColor yOriginalColor = y->color;
        if (z->left == nullptr) {
            x = z->right;
            transplant(root, z, z->right);
        }
        else if (z->right == nullptr) {
            x = z->left;
            transplant(root, z, z->left);
        }
        else {
            y = minValueNode(z->right);
            yOriginalColor = y->color;
            x = y->right;
            if (y->parent == z) {
                if (x != nullptr)
                    x->parent = y;
            }
            else {
                transplant(root, y, y->right);
                y->right = z->right;
                y->right->parent = y;
            }
            transplant(root, z, y);
            y->left = z->left;
            y->left->parent = y;
            y->color = z->color;
        }
        delete z;
        if (yOriginalColor == TREE_NODE_BLACK) {
            fixDelete(x);
        }
    }

    ValueType search(KeyType key)
    {
        Node* current = root;
        while (current != nullptr) {
            if (key == current->key_data) {
                return current->value_data;
            }
            else if (key < current->key_data) {
                current = current->left;
            }
            else {
                current = current->right;
            }
        }
        return 0; // Return default value_data if not found
    }

    bool isEmpty(){
        return(root == nullptr ? 1:0);
    }

};


#endif