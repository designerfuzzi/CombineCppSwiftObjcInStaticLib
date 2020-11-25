//
//  AppDelegate.m
//  sim backend Mac
//
//  Created by Ol Sen on 23.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "AppDelegate.h"
#import <AppKit/AppKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
}
-(void)applicationDidResignActive:(NSNotification *)notification {
    NSLog(@"DidResignActive");
    
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
