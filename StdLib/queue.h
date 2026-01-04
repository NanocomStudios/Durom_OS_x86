#ifndef QUEUE_H
#define QUEUE_H

template <typename ObjectType>
class Queue {

private:

    class QueueNode {
    public:
        ObjectType obj;
        QueueNode* next;
        QueueNode(ObjectType o) : obj(o), next(nullptr) {}
    };

    QueueNode* head = nullptr;
    QueueNode* tail = nullptr;

public:
    
    void enqueue(const ObjectType& obj) {
        QueueNode* newNode = new QueueNode(obj);
        if (tail) {
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