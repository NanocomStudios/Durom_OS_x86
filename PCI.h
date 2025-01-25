#ifndef PCI
#define PCI

unsigned short pciConfigReadWord(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset);

#endif