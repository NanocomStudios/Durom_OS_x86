#ifndef IO
#define IO

void outb(unsigned short port, unsigned char data);

unsigned char inb(unsigned short port);

void outw(unsigned short port, unsigned short value);

unsigned short inw(unsigned short port);
void outl(unsigned short port, unsigned int value);

unsigned int inl(unsigned short port);

void io_wait(void);
#endif