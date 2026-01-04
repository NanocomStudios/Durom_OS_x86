#ifndef CPPSTD_H
#define CPPSTD_H

template<typename T> void swap(T& t1, T& t2) {
    T tmp(t1);
    t1=t2;
    t2=tmp;
}

#endif