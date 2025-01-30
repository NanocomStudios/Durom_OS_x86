#ifndef PS2
#define PS2

#define READ 1
#define WRITE 2

void ps2Wait(unsigned char mode);
void ps2Write(unsigned char data);
unsigned char ps2Read();

#endif