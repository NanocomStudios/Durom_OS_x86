#ifndef PCI
#define PCI

#pragma pack(1)

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
unsigned int pciConfigReadDouble(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset);
void pciInit();
void printPciList();
short getClassCount(unsigned char classCode);
pciNode* getClassCategory(unsigned char classCode);
#endif