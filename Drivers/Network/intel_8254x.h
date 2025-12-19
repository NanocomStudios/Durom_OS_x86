#ifndef INTEL_8254X_H
#define INTEL_8254X_H
#include "networkDriver.h"

class intel_8254x : public NetworkDriver{
    public:
    void init();

    void write_register(unsigned short register, unsigned int value);
    unsigned int read_register(unsigned short register);

};

#endif