#ifndef HDD
#define HDD

#pragma pack(1)

struct DriveInfo{
    short id;
    short noOfFixCylinders;
    short noOfRemovableCylinders;
    short noOfHeads;
    short noOFUnformatBytesPerPhysicalTrack;
    short noOfUnformatBytesPerSector;
    short noOfBytesInInnerSectorGaps;
    short noOfBytesInSyncField;
    short defaultZero;
    char serialNo[20];
    short controllerType;
    short controllerBufferSize;
    short ECCByteCount;
    char firmwareVersion[8];
    char modelNumber[40];
    short noOfSectors;
    short doubleWordTransferFlag;
    short writeProtected;
};

struct PartitionRecord{
    char bootFlag;
    char CHSBegin[3];
    char typeCode;
    char CHSEnd[3];
    unsigned int LBABegin;
    unsigned int noOfSectors;
};

struct MBR{
    char bootCode[512];
    //PartitionRecord p1;
    //PartitionRecord p2;
    //PartitionRecord p3;
    //PartitionRecord p4;
    //unsigned short magicNumber;
};

void hddWait();
void getDriveInfo(void* buffer);
void readSectors(void* buffer, unsigned char sectorCount, unsigned int address);

#endif