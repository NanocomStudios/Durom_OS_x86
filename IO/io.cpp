#include "io.h"

void outb(unsigned short port, unsigned char data){
	asm volatile("outb %0, %1" : : "a"(data), "Nd"(port));
	return;
}

unsigned char inb(unsigned short port){
	unsigned char res;
	asm volatile("inb %1, %0" : "=a"(res) : "Nd"(port));
	return res;
}

/**************** SEND/RECEIVE WORD ******************/

void outw(unsigned short port, unsigned short value)
{
	asm volatile ("outw %w0, %1" : : "a" (value), "id" (port) );
}

unsigned short inw(unsigned short port){
   unsigned short ret;
   asm volatile ("inw %1, %0" : "=a" (ret) : "dN" (port));
   return ret;
} 

/**************** SEND/RECEIVE LONG (32-BIT) ******************/

void outl(unsigned short port, unsigned int value){
	asm volatile ("outl %%eax, %%dx" :: "d" (port), "a" (value));
}

unsigned int inl(unsigned short port){
   unsigned int ret;
   asm volatile ("inl %1, %0" : "=a" (ret) : "dN" (port));
   return ret;
} 