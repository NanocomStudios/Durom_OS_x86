#include "driver.h"
#include "../StdLib/vector.h"
#include "../FileSystem/fileSystem.h"

#include "Network/networkDriver.h"

Vector<Driver*> *drivers = 0;

void init_drivers(){
    drivers = new Vector<Driver*>();
    networkDriverInit(drivers);
}

Vector<Driver*> *getDriversList(){
    return drivers;
}

void addDriversToDev(){
    if(drivers == 0) return;

    Directory* root = getFSRoot();
    FileSystem* dev_dir = root->getFSEntry("dev");

    if(dev_dir == 0){
        dev_dir = new Directory("dev");
    }else if(dev_dir->type != FS_DIR){
        return;        
    }

    Directory* dev = (Directory*)dev_dir;

    for(uint64_t i = 0; i < drivers->size(); i++){
        Driver* drv = drivers->arr[i];
        printf("Adding to dev \"%s\" with mode %d\n", drv->devName, drv->devMode);
        if(drv->devMode == 1){
            dev->addFile(new DriverFile(drv));
            printf("Added\n");
        }
    }
}