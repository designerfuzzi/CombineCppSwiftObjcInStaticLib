//
//  BLE_Central.swift
//  Hub_lib
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#if os(macOS)
import Cocoa
#else
import UIKit
#endif

import CoreBluetooth
import os

var centralManager: CBCentralManager = CBCentralManager()


class BLE_Central: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        os_log("centralManagerDidUpdateState")
    }
    
    var discoveredPeripheral: CBPeripheral?
    var transferCharacteristic: CBCharacteristic?
    var writeIterationsComplete = 0
    var connectionIterationsComplete = 0

    let defaultIterations = 5     // change this value based on test usecase

    var data = Data()

    @objc public func run_central()
    {
        os_log("run_central")
        // do crazy stuff with centralManager here
        //os_log("started")
    }
    
}
