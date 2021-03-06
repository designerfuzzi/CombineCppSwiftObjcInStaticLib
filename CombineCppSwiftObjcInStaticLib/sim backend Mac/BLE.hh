//
//  BLE.h
//  sim backend UI
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

//#import "TargetConditionals.h"
//#if TARGET_OS_IOS
#import <Foundation/Foundation.h>
//#else
//#import <Cocoa/Cocoa.h>
//#endif

#import <CoreBluetooth/CoreBluetooth.h>

#if TARGET_OS_IOS
#import <Hub_lib/Hub_lib.h>
#else
#import <Hub_lib_mac/Hub_lib.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BLE: NSObject

@property (strong, nonatomic) CBPeripheralManager* peripheralManager;
@property (strong, nonatomic) CBMutableCharacteristic* transferCharacteristic;
@property (strong, nonatomic) NSData* dataToSend;
@property (nonatomic, readwrite) NSInteger sendDataIndex;

-(void)start_central;

@end /* BLE_h */

NS_ASSUME_NONNULL_END
