#include <atomic>

class Spinlock{
    std::atomic_flag* l;

    public:
        Spinlock(){
            l = new std::atomic_flag();
            l->clear();
        }
        Spinlock(std::atomic_flag* lock){
            l = lock;
            l->clear();
        }

        void acquire(){
            while(l->test_and_set(std::memory_order_acquire)){
               asm volatile("pause");
            }
        }

        void release(){
            l->clear(std::memory_order_release);
        }
};