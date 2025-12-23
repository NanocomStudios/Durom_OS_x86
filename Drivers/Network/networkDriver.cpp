#include "networkDriver.h"
#include "intel_8254x.h"

#include "../../IO/PCI.h"
#include "../../Graphics/VGA.h"

NetworkDriver* networkDriverInit(){
    pciNode* networkDevice = getPciNodeList(0x02, 0x00, 0x00);
    if(networkDevice == 0){
        print("No Network Device Found!\n");
        return 0;
    }

    while(networkDevice != 0){
        pciHeader* header = getPciHeader(networkDevice);
        
        switch(header->vendorID){
            case 0x8086: //Intel
                switch(header->deviceID){
                    case 0x100E:
                        print("Intel PRO/1000 MT Desktop Adapter Found!\n");
                        return new intel_8254x;
                        break;
                    default:
                        print("Unknown Intel Network Device Found!\n");
                        return 0;
                        break;
                }
                break;
            case 0x10EC: //Realtek
                switch(header->deviceID){
                    case 0x8161:
                    case 0x8168:
                    case 0x8169:
                        print("Realtek Network Adaptor Found!\n");
                        return 0;
                        break;
                    default:
                        print("Unknown Realtek Network Device Found!\n");
                        return 0;
                        break;
                }
                break;
            default:
                print("Unknown Network Device Found!\n");
                break;
        }
        networkDevice = networkDevice->next;
    }
    return 0;
}