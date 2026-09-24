#ifndef DRIVER_H
#define DRIVER_H

#include <stdint.h>
#include "../StdLib/vector.h"


enum DriverType{
    NETWORK_DRIVER,
    AUDIO_DRIVER,
    STORAGE_DRIVER
};

class [[gnu::packed]] Driver{
    public:
        DriverType type;
        uint8_t devMode = 0;
        char* devName = 0;
        virtual void init() = 0;
        virtual void interruptHandler() = 0;
        virtual uint64_t devRead(void* buffer, uint64_t length) = 0;
        virtual uint64_t devWrite(void* buffer, uint64_t length) = 0;
};

void init_drivers();
Vector<Driver*> *getDriversList();
void addDriversToDev();

#endif