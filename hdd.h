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

struct FSInfo{
    unsigned int leadSig;
    char Rsv1[480];
    unsigned int structSig;
    unsigned int freeCount;
    unsigned int nextFree;
    char Rsv2[12];
    unsigned int trailSig;
};

struct VolumeInfo{
    char rsv1[3];
    char OEMName[8];
    unsigned short bytesPerSec;
    unsigned char secPerClus;
    unsigned short rsvdSecCount;
    unsigned char fatCount;
    unsigned short rootEntryCount;
    unsigned short totalSector16Bit;
    unsigned char mediaType;
    unsigned short fatSize16Bit;
    unsigned short secPerTrack;
    unsigned short headsCount;
    unsigned int hiddenSectorCount;
    unsigned int totalSectorCount32Bit;
    unsigned int fatSize32Bit;
    unsigned short extFlags;
    unsigned short version;
    unsigned int rootCluster;
    unsigned short FSInfoLocation;
    unsigned short backuoBootSector;
    char rsv2[12];
    unsigned char driveNo;
    char rsv3;
    unsigned char bootSignature;
    unsigned int volumeID;
    char volumeLabel[11];
    char fileSystemType[8];
    char rsv4[420];
    unsigned short magicNumber;
};

struct DirectoryEntry{
    char shortName[11];
    unsigned char attribute;
    unsigned char rsv1;
    unsigned char crtTimeTenth;
    unsigned short crtTime;
    unsigned short crtDate;
    unsigned short lastAccesDate;
    unsigned short firstClusHI;
    unsigned short wrtTime;
    unsigned short wrtDate;
    unsigned short firstClusLO;
    unsigned int size;
};

struct MBR{
    char bootCode[446];
    PartitionRecord p1;
    PartitionRecord p2;
    PartitionRecord p3;
    PartitionRecord p4;
    unsigned short magicNumber;
};

void hddWait();
void getDriveInfo(void* buffer);
void readSectors(void* buffer, unsigned char sectorCount, unsigned int address);

#endif