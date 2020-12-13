//
//  Hub_lib.h
//  Hub_lib
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//
#pragma once

#import "TargetConditionals.h"

#if TARGET_OS_IOS
#import <Foundation/Foundation.h>
#else
#import <Cocoa/Cocoa.h>
#endif
// we want the lib header as clean as possible
// it will then be imported in your project with '#import <Hub_lib/Hub_lib.h>'

// auto-generated swift -> objc bridging header imported here will
// mess it up when imported somewhere else.
// so when using swift->objc bridging you will placed the next line in .m file instead
// #import "Hub_lib-Swift.h"

//@class BLE_Central; // pre-declaration of a later fully declared Class.
// as we moved the property into .m file we dont need it here.
extern char global_sensor_data_buf[300];

@interface Hub_lib : NSObject

// to make this work you would need pre-declaration of BLE_Central, see above interface
//@property BLE_Central *ble; // placed in .m interface extension instead.

-(void)run_central;

@end

