//
//  RPMMotionReader.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation
import CoreMotion

final class RPMMotionReader: RPMReader {
    private let standardUpdateIntervalValue: Double = 1/60
    private var motion:CMMotionManager
    private var timer:Timer?
    private let _updateValue:Double
    private let _isRoundendValue:Bool
    private let reference:Int
    private var notCounted:Bool
    
    private var accelerometerRounded = (x: 0, y: 0, z: 0)
    
    init(reference Gy: Int, radius: Int, begin:Int16, weight:Double){
        self._updateValue = standardUpdateIntervalValue
        self._isRoundendValue = true
        self.motion = CMMotionManager()
        self.reference = Gy
        self.notCounted = true
        super.init(begin: begin, radius: radius, weight: weight)
        
        if self.motion.isDeviceMotionAvailable{
            self.motion.deviceMotionUpdateInterval = standardUpdateIntervalValue
            super.initError = false
        } else {
            super.initError = true
        }
        print("RPMReader started in RPMMotionReader Mode... good luck\nValue: Reference: \(self.reference), Radius: \(self.radius), Weight: \(self.weight)")
    }
    
    public func round(accelerometer value: Double) -> Int {
        return Int(value*10)
    }
    
    override public func startRPM() {
        print("Start RPM Motion")
        self.timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        self.motion.startDeviceMotionUpdates(to: .main) { (data, error) in
            guard error == nil else {
                super.initError = true
                return
            }
            if let dt = data {
                let accelerometerRounded = self.round(accelerometer: dt.gravity.y)
                if accelerometerRounded < self.reference {    // If gravity on y it's < of max Gy registered, then set up
                    self.notCounted = true       // Boolean variable begin set to enable count next revolution
                } else if (accelerometerRounded == self.reference) && self.notCounted{ // If gravity on y it's 9 (max) and bool notCounted it's true, then
                    super.rpm.counted+=1 // Update count value
                    super.rpm.total+=1
                    self.notCounted = false
                    print("RPMMotionReader counted value: \(self.rpm.counted)")
                }
            }
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
    
    @objc public func updateCounting() {
        print("Begin update")
        super.update()
        print("Timer OK")
    }
}
