//
//  BLE.m
//  sim backend UI
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "BLE.hh"

@interface BLE ()
@end

@implementation BLE

-(void)start_central
{
    NSLog(@"invoked BLE start_central");
    Hub_lib *Hub_central = [Hub_lib new];
    [Hub_central run_central];
}

@end
