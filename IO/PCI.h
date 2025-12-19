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
    unsigned short deviceID;
    unsigned short vendorID;
    pciNode* next;
};

struct pciHeader{
    unsigned short vendorID;
    unsigned short deviceID;
    unsigned short command;
    unsigned short status;
    unsigned char revisionID;
    unsigned char progIF;
    unsigned char subClass;
    unsigned char classCode;
    unsigned char cacheLineSize;
    unsigned char latencyTimer;
    unsigned char headerType;
    unsigned char bist;
    unsigned int bar0;
    unsigned int bar1;
    unsigned int bar2;
    unsigned int bar3;
    unsigned int bar4;
    unsigned int bar5;
    unsigned int cardbusCISPointer;
    unsigned short subsystemVendorID;
    unsigned short subsystemID;
    unsigned int expansionROMBaseAddress;
    unsigned char capabilitiesPointer;
    unsigned char reserved[7];
    unsigned char interruptLine;
    unsigned char interruptPin;
    unsigned char minGrant;
    unsigned char maxLatency;

};

unsigned short pciConfigReadWord(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset);
unsigned int pciConfigReadDouble(unsigned char bus, unsigned char slot, unsigned char func, unsigned char offset);
void pciInit();
void printPciList();
short getClassCount(unsigned char classCode);
pciNode* getClassCategory(unsigned char classCode);
pciNode* getPciNodeList(unsigned char classCode, unsigned char subClass, unsigned char progIF);
pciHeader* getPciHeader(pciNode* node);
#endif