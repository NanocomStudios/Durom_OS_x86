#include "fat32.h"
#include "hdd.h"
#include "../Graphics/VGA.h"
#include "../StdLib/malloc.h"

short partitionCount;

PartitionListNode* partitionList;

void initFat32Drives(){
    partitionList = 0;
    print("Init fat32\n");
    hddEntry* hddEntryList;
    short hddCount;

    hddEntryList = getHddEntryList();
    hddCount = getHddCount();

    MBR* mbr = (MBR*)malloc(sizeof(MBR));
    for(short i = 0; i < hddCount; i++){
        if(hddEntryList[i].driveAvilable == 1){
            setDrive(hddEntryList[i].baseAddress, hddEntryList[i].masterSlave);
            hddWait();
            PartitionRecord* ptr = &(mbr->p1);
            
            if(readSectors(mbr, 1, 0)){
                printHex(mbr->magicNumber);
                print('\n');
                // for(int j = 0; j < 512; j++){
                //     printHexV(*((char*)mbr + j));
                // }
                for(char j = 0; j < 4; j++){
                    if((ptr[j].typeCode == 0x0C) || (ptr[j].typeCode == 0x0B)){
                        PartitionListNode* pList = partitionList;
                        if(pList == 0){
                            partitionList = (PartitionListNode*)malloc(sizeof(PartitionListNode));
                            partitionList->partition = ptr[j];
                            partitionList->next = 0;
                            partitionList->hddEntryIndex = i;
                        }else{
                            while(pList->next != 0){
                                pList = pList->next;
                            }
                            PartitionListNode* tmp = (PartitionListNode*)malloc(sizeof(PartitionListNode));
                            tmp->partition = ptr[j];
                            tmp->next = 0;
                            tmp->hddEntryIndex = i;
                            pList->next = tmp;
                        }
                    }
                }
            }
        }
    }
    free(mbr);
    print("Init fat32 done\n");
}

short getPartitionCount(){
    short i = 0;
    PartitionListNode* pList = partitionList;
    while(pList != 0){
        i++;
        pList = pList->next;
    }
    return i;
}

PartitionListNode* getPartition(short node){
    short i = 0;
    PartitionListNode* pList = partitionList;
    while((pList != 0) && (i < node)){
        i++;
        pList = pList->next;
    }
    return pList;
}

void printPartitionList(){
    short i = 0;
    PartitionListNode* pList = partitionList;
    if(pList == 0){
        print("No Partitions Available.\n");
    }
    while(pList != 0){
        printInt(i);
        print("> ");
        printInt(pList->partition.noOfSectors / 2);
        print(" KB.  Drive -> ");
        printInt(pList->hddEntryIndex);
        print('\n');
        i++;
        pList = pList->next;
    }
}