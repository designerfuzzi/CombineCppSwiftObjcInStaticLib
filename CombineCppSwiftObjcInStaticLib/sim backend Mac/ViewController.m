//
//  ViewController.m
//  sim backend Mac
//
//  Created by Ol Sen on 23.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) BLE *ble;
@property (nonatomic) ThreadManagerExample *manager;
@end

@implementation ViewController {
    NSImageView *imgView;
    id<NSObject> keepfront;
    pid_t lastFocusedPID;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSButton *btn = [NSButton buttonWithTitle:@"run simple central" target:self action:@selector(run_simple_central:)];
    btn.frame = CGRectMake(50, 0, 200, 50);
    btn.layer.backgroundColor = NSColor.orangeColor.CGColor;
    btn.layer.cornerRadius = 5.0f;
    [self.view addSubview:btn];
    
    NSRect rect = CGRectMake(0, 0, 48, 48);
    imgView = [[NSImageView alloc] initWithFrame:rect];
    imgView.image = nil;
    [self.view addSubview:imgView];
    
    
    _manager = [[ThreadManagerExample alloc] init];
    [_manager start];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(watcher:) name:@"focusedBundleIdentifierNotification" object:nil];
    
    
    keepfront = [[NSNotificationCenter defaultCenter] addObserverForName:NSApplicationDidResignActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        //[self.view.window makeKeyAndOrderFront:self];
         [self.view.window setLevel:NSFloatingWindowLevel];
        //NSNormalWindowLevel //The default level for NSWindow objects.
        //NSFloatingWindowLevel //Useful for floating palettes.
        //NSSubmenuWindowLevel //Reserved for submenus. Synonymous with NSTornOffMenuWindowLevel, which is preferred.
        //NSTornOffMenuWindowLevel //The level for a torn-off menu. Synonymous with NSSubmenuWindowLevel.
        //NSModalPanelWindowLevel //The level for a modal panel.
        //NSMainMenuWindowLevel //Reserved for the application’s main menu.
        //NSStatusWindowLevel // The level for a status window.
        //NSPopUpMenuWindowLevel //The level for a pop-up menu.
        //NSScreenSaverWindowLevel //The level for a screen saver.
        //kCGDesktopWindowLevel
        
    }];
}

-(void)dealloc {
    [_manager stop];
    _manager = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:keepfront];
}

-(void)watcher:(NSNotification*)note {
    lastFocusedPID = [note.userInfo[@"focusedPID"] intValue];
    NSRunningApplication *app = [NSRunningApplication runningApplicationWithProcessIdentifier:lastFocusedPID];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->imgView.image = app.icon;
    });
    [self getAvailableWindows];
}

-(void)getAvailableWindows {
    NSString *winNumberKey = (__bridge NSString*)kCGWindowNumber;
    NSString *ownerPIDKey = (__bridge NSString*)kCGWindowOwnerPID;
    //NSString *ownerNameKey = (__bridge NSString*)kCGWindowOwnerName;
    NSString *winNameKey = (__bridge NSString*)kCGWindowName;
    NSString *winBoundsKey = (__bridge NSString*)kCGWindowBounds;
    CFArrayRef windowList = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly | kCGWindowListExcludeDesktopElements, kCGNullWindowID);
   
    for (int i=0; i < CFArrayGetCount(windowList); i++) {
       
        CFDictionaryRef windict = CFArrayGetValueAtIndex(windowList, i);
        NSDictionary *dict = (__bridge NSDictionary *)windict;
        pid_t winOwnerPID = (pid_t)[dict[ownerPIDKey] intValue];
        
        if (winOwnerPID == lastFocusedPID) {
            //NSString* winOwnerName = (NSString*)dict[ownerNameKey];
            //CGWindowID windowNumber = (CGWindowID)[dict[winNumberKey] intValue];
            NSInteger winNumber = (NSInteger)[dict[winNumberKey] integerValue];
            NSString* winName = (NSString*)dict[winNameKey];
            
            CGRect rect;
            CGRectMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dict[winBoundsKey], &rect);
            NSString *rectStr = [NSString stringWithFormat:@"{x%0.f,y%0.f,w%0.f,h%0.f}", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height];
            NSLog(@"window '%@' %@ %ld", winName, rectStr, winNumber);
            
            // works only for your own windows
            // dispatch_async(dispatch_get_main_queue(), ^{
            //     NSWindow * window = [NSApp windowWithWindowNumber:winNumber];
            //     CGWindowID window_id = (CGWindowID)[window windowNumber];
            //     NSString *title = window.title;
            //     NSLog(@"title=%@ %p %u",title, window, window_id);
            // });
            
            break; // the first one is enough
        }
    }
}

- (IBAction)run_simple_central:(id)sender {

    // BLE needs to be allocated to take effect.
    if (!_ble) _ble = [[BLE alloc] init];
    
    // testing.. should log "run_central" + "Scanning started"
    [self.ble start_central];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
