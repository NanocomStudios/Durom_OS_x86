#ifndef QUEUE_H
#define QUEUE_H

#include "../Graphics/VGA.h"

template <typename ObjectType>
class Queue {

private:

    struct QueueNode {
        ObjectType obj;
        QueueNode* next;

        QueueNode(const ObjectType& o) : obj(o), next(nullptr) {}
    };

    QueueNode* head = nullptr;
    QueueNode* tail = nullptr;

public:
    
    ~Queue() {
        while (!isEmpty()) {
            dequeue();
        }
    }

    void enqueue(const ObjectType& obj) {
        QueueNode* newNode = new QueueNode(obj);
        
        if (tail != nullptr) {
            tail->next = newNode;
        }
        tail = newNode;
        if (!head) {
            head = newNode;
        }
    }

    ObjectType dequeue() {
        if (!head) {
            return 0;;
        }
        QueueNode* temp = head;
        ObjectType retObj = head->obj;
        head = head->next;
        if (!head) {
            tail = nullptr;
        }
        delete temp;
        return retObj;
    }

    bool isEmpty() {
        return head == nullptr;
    }
};

#endif