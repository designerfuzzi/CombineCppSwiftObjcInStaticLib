//
//  ViewController.m
//  sim backend UI
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) BLE *ble;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 200, 50);
    [btn setTitle:@"run simple central" forState:(UIControlStateNormal)];
    [btn setTitleColor:UIColor.greenColor forState:(UIControlStateNormal)];
    btn.layer.backgroundColor = UIColor.orangeColor.CGColor;
    btn.layer.cornerRadius = 5.0f;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(run_simple_central:) forControlEvents:(UIControlEventTouchUpInside)];

    
}

- (IBAction)run_simple_central:(id)sender {

    // BLE needs to be allocated to take effect.
    if (!_ble) _ble = [[BLE alloc] init];
    
    // testing.. should log "run_central" + "Scanning started"
    [self.ble start_central];
}

@end
