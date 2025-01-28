#ifndef PCI
#define PCI

struct pciNode{
    unsigned char bus;
    unsigned char slot;
    unsigned char func;
    unsigned char classCode;
    unsigned char subClass;
    unsigned char progIF;
    pciNode* next;
};

unsigned short pciConfigReadWord(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset);
void pciInit();
void printPciList();
#endif