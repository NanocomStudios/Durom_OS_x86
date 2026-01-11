#include <atomic>

// Optimize this

class Spinlock{
    std::atomic_flag l;
    std::atomic_flag* el;
    bool type = 0; // 0 = internal, 1 = external

    public:
        Spinlock(){
            type = 0;
            l.clear();
        }
        Spinlock(std::atomic_flag* lock){
            type = 1;
            el = lock;
            el->clear();
        }

        void acquire(){
            if(type == 1){
                while(el->test_and_set(std::memory_order_acquire)){
                    asm volatile("pause");
                }
            }else{
                while(l.test_and_set(std::memory_order_acquire)){
                asm volatile("pause");
                }
            }
        }

        void release(){
            if(type == 1){
                el->clear(std::memory_order_release);
            }else{
                l.clear(std::memory_order_release);
            }
        }
};