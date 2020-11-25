//
//  Hub_lib.m
//  Hub_lib
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "Hub_lib.h"
#import <CoreBluetooth/CoreBluetooth.h>
#if TARGET_OS_IOS
#import "Hub_lib-Swift.h"
#else
#import "Hub_lib_mac-Swift.h"
#endif
#import "HubCPP.h"

@interface Hub_lib ()
@property BLE_Central *ble_central;
@end;

@implementation Hub_lib

-(instancetype)init {
    if (!(self=[super init])) return nil;
    _ble_central = [[BLE_Central alloc] init];
    return self;
}
-(void)run_central {
    [_ble_central run_central];
    SomeCPPClass *cpp = new SomeCPPClass(@"justSomeObject",2);
    unsigned int idx = cpp->getCurrentIdx();
    id<NSObject> o = cpp->getBufferedObject(idx);
    NSLog(@"objectiveCplusplus testIdx = %u %@", idx, o);
}

@end
