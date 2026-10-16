#ifndef QUEUE_H
#define QUEUE_H

#include "../Graphics/VGA.h"
#include "lock.h"

template <typename ObjectType>
class Queue {

private:

    struct QueueNode {
        ObjectType obj;
        QueueNode* next;

        QueueNode(const ObjectType& o) : obj(o), next(nullptr) {}
    };
    Spinlock mutex;
    QueueNode* head = nullptr;
    QueueNode* tail = nullptr;

public:
    
    ~Queue() {
        while (!isEmpty()) {
            dequeue();
        }
    }

    void enqueue(const ObjectType& obj) {
        mutex.acquire();
        QueueNode* newNode = new QueueNode(obj);
        
        if (tail != nullptr) {
            tail->next = newNode;
        }
        tail = newNode;
        if (!head) {
            head = newNode;
        }
        mutex.release();
    }

    ObjectType dequeue() {
        if (!head) {
            return 0;;
        }
        mutex.acquire();
        QueueNode* temp = head;
        ObjectType retObj = head->obj;
        head = head->next;
        if (!head) {
            tail = nullptr;
        }
        mutex.release();
        delete temp;
        return retObj;
    }

    bool isEmpty() {
        return head == nullptr;
    }
};

#endif