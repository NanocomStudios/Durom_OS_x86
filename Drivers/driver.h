#ifndef DRIVER_H
#define DRIVER_H

class [[gnu::packed]] Driver{
    public:
        virtual void init() = 0;
        virtual void interruptHandler() = 0;
};

#endif