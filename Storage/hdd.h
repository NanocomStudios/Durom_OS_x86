#ifndef HDD
#define HDD

#define MASTER 0
#define SLAVE 1

#define LBA 1
#define CHS 0

#define PRIMARY_PORT 0x1f0
#define SECONDARY_PORT 0x170

#define LBA_MODE_BIT 6
#define MASTER_SLAVE_BIT 3

#define BUSY 128
#define READY 64

#define ERROR 1

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

void setDrive(short port, char masterSlave, char lba);
void hddWait();
char isReady();
char isError();
void getDriveInfo(void* buffer);
void readSectors(void* buffer, unsigned char sectorCount, unsigned int address);

#endif