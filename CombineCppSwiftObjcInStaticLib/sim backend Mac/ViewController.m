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
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSButton *btn = [NSButton buttonWithTitle:@"run simple central" target:self action:@selector(run_simple_central:)];
    btn.frame = CGRectMake(100, 100, 200, 50);
    btn.layer.backgroundColor = NSColor.orangeColor.CGColor;
    btn.layer.cornerRadius = 5.0f;
    [self.view addSubview:btn];
    
    NSRect rect = CGRectMake(0, 0, 100, 100);
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
    pid_t pid = [note.userInfo[@"focusedPID"] intValue];
    NSRunningApplication *app = [NSRunningApplication runningApplicationWithProcessIdentifier:pid];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->imgView.image = app.icon;
    });
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
