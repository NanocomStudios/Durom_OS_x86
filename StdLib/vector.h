#ifndef VECTOR_H
#define VECTOR_H

#include <cstdint>

//https://www.geeksforgeeks.org/cpp/how-to-implement-our-own-vector-class-in-c/

template <typename T> class Vector {

    // capacity is the total storage
    // capacity of the vector
    uint64_t capacity;

    // current is the number of elements
    // currently present in the vector
    uint64_t current;

public:

    // arr is the integer pointer
    // which stores the address of our vector
    T* arr;

    // Default constructor to initialise
    // an initial capacity of 1 element and
    // allocating storage using dynamic allocation
    Vector()
    {
        arr = new T[1];
        capacity = 1;
        current = 0;
    }
    // destructor to deallocate storage allocated by dynamic
    // allocation to prevent memory leak
    ~Vector() { delete[] arr; }

    // Function to add an element at the last
    void push(T data)
    {

        // if the number of elements is equal to the
        // capacity, that means we don't have space to
        // accommodate more elements. We need to double the
        // capacity
        if (current == capacity) {
            T* temp = new T[2 * capacity];

            // copying old array elements to new array
            for (uint64_t i = 0; i < capacity; i++) {
                temp[i] = arr[i];
            }

            // deleting previous array
            delete[] arr;
            capacity *= 2;
            arr = temp;
        }

        // Inserting data
        arr[current] = data;
        current++;
    }

    // function to add element at any index
    void push(T data, uint64_t index)
    {

        // if index is equal to capacity then this
        // function is same as push defined above
        if (index == capacity)
            push(data);
        else
            arr[index] = data;
    }

    // function to extract element at any index
    T get(uint64_t index)
    {
        // if index is within the range
        if (index < current)
            return arr[index];
        // if index is not within range
        return -1;
    }

    // function to delete last element
    void pop() { current--; }

    // function to get size of the vector
    uint64_t size() { return current; }

    // function to get capacity of the vector
    uint64_t getcapacity() { return capacity; }

};

#endif