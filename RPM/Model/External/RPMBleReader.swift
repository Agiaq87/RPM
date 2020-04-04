//
//  RPMBleReader.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 24/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation
import CoreBluetooth

enum StatusBLE:String {
    case scan = "Scanning BLE devices"
    case found = "Founding BLE device"
    case searchService = "Searching BLE Service"
    case searchCharacteristics = "Searching BLE Characteristics"
    case connecting = "Connecting to founded device"
    case connected = "Connected"
}

final class RPMBleReader: RPMReader, CBPeripheralDelegate, CBCentralManagerDelegate {
    private var central:CBCentralManager!
    private var peripheral:CBPeripheral!
    private var wheelCh:CBCharacteristic!
    private var crankCh:CBCharacteristic!
    
    public let unitUUID = CBUUID.init(string: "0x1801")
    public let serviceUUID = CBUUID(string: "0x1816")
    public let characteristicsWheelUUID = CBUUID(string: "0x2A5B")
    public let characteristicsCrankUUID = CBUUID(string: "0x2A5C")
    
    public var scanBleDevices:[String] = []
    public var response = "NAN"
    
    @Published public var connectedToDevice:Bool = false
    
    override init(begin: Int16, radius: Int, weight: Double) {
        print("RPMBLE Init")
        super.init(begin: begin, radius: radius, weight: weight)
    }
    
    
    override public func startRPM() {
        print("Init CentralManager -iPhone related-")
        self.central = CBCentralManager(delegate: self, queue: nil)
        print("CentralManager created, insert into main queue to dispatch events")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.centralManagerDidUpdateState(self.central)
        }
        print("That's all, folks!")
    }
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Need to control CentralManager state:")
        switch central.state {
            case .unsupported:
             print("BLE is Unsupported??? ")
             break
            case .unauthorized:
             print("BLE is Unauthorized")
             break
            case .unknown:
             print("BLE is Unknown")
             break
            case .resetting:
             print("BLE is Resetting")
             break
            case .poweredOff:
             print("BLE is Powered Off")
             break
            case .poweredOn:
             print("Bluetooth ON, Central scanning for", self.serviceUUID)
//             self.central.scanForPeripherals(withServices: [self.serviceUUID],options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
             print("Before scan...")
             print("central obj: \(central)")
             self.startScan()
             print("After scan...")
            @unknown default:
             print("Future... in a real application this will be never exist")
            }
    }
    
//    Start scanning
    func startScan() {
        print("Now Scanning...")
//        self.central.scanForPeripherals(withServices: [self.unitUUID, self.serviceUUID], options: [CBCentralManagerScanOptionAllowDuplicatesKey:false])
        self.central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:false])
    }
    
    
    // Handles the result of the scan
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Peripheral Name: \(String(describing: peripheral.name))  RSSI: \(String(RSSI.doubleValue))")
        if peripheral.name == "[BLE] RPM" {
            print("I found it! finally")
            self.central.stopScan()
            self.peripheral = peripheral
            self.scanBleDevices.append(peripheral.name!)
            self.peripheral.delegate = self
//            self.status = "Connecting to \(peripheral.name)"
//            print("Associate \(self.peripheral) and connecting to \(peripheral.name)")
            self.central.connect(self.peripheral, options: nil)
        }
    }
    
    // The handler if we do connect successfully
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == self.peripheral {
                   print("Connection established")
            self.peripheral.discoverServices([self.serviceUUID])
        }
    }
    
    // Handles discovery event
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services{
            for service in services {
                print(service)
                print(service.characteristics ?? "Void Characteristics")
                if service.uuid == self.serviceUUID {
                    print("Service discover! UUID: \(service)")
                    peripheral.discoverCharacteristics([self.characteristicsWheelUUID, self.characteristicsCrankUUID], for: service)
                    return
                }
            }
        }
        print("No service founded, return...")
    }
    
    // Handling discovery of characteristics
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let ch = service.characteristics else {
            print("No characteristics found, return ...")
            return
        }
        print("Founded \(ch.count) characteristic(s)")
        for c in ch {
            print("Analizing characteristics: \(c)")
            if c.uuid.isEqual(self.characteristicsWheelUUID)  {
                self.wheelCh = c
                peripheral.setNotifyValue(true, for: self.wheelCh)
            }
            if c.uuid.isEqual(self.characteristicsCrankUUID)  {
                self.crankCh = c
                peripheral.setNotifyValue(true, for: self.crankCh)
            }
            if c.properties.contains(.read) {
                print("\(c.uuid) properties contains .read")
            }
            if c.properties.contains(.notify) {
                print("\(c.uuid) properties contains .notify")
            }
        }
        self.connectedToDevice = true
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if characteristic == self.crankCh {
            super.update()
            print("Update")
        }
        if characteristic == self.wheelCh {
            super.rpm.counted += 1
            print("Counting...")
        }
    }

}

