//
//  RPMProtocol.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation

struct Rpm {
    var last:Int16
    var previous:Int16
    var max:Int16
    var min:Int16
    var avg:Double
    var counted:Int16
    var total:Int64
    var rpmData:[Double]    // For Charts only!
    var distance:Double
    var velocityLast:Double
    var velocityPrev:Double
    var velocityAvg:Double
    var joule:Double
    var kcal:Int64
    var minute:Int8
    var hour:Int8
}

public class RPMReader: NSObject, ObservableObject {
    public let toRadius: Double = Double.pi/30
    public let toKCal:Double = 0.000239006
    public let radius: Double // from mm to m
    public let weight: Double

    @Published var rpm:Rpm
    
    @Published var initError:Bool = false

    init(begin counted:Int16, radius:Int, weight:Double) {
        self.rpm = Rpm(last: 0, previous: 0, max: 0, min: 0, avg: 0, counted: counted, total: Int64(counted), rpmData: [0], distance: 0.0, velocityLast: 0.0, velocityPrev: 0.0, velocityAvg: 0.0, joule: 0.0, kcal: 0, minute: 0, hour: 0)
        self.radius = Double(radius)/1000
        self.weight = weight
        print("RPMReader init started in Normal Mode")
    }

    public func startRPM() {
//        Counting rpm...
    }

    public func update() {
        print("Begin update")
        self.rpm.last = self.rpm.counted
        self.rpm.rpmData.append(Double(self.rpm.counted))
        
        if self.rpm.counted != 0 {     // When user wait, don't update
            self.rpm.counted = 0
            if self.rpm.max < self.rpm.last{
                self.rpm.max = self.rpm.last
            }
            if self.rpm.min > self.rpm.last || self.rpm.min == 0 {
                self.rpm.min = self.rpm.last
            }
            if self.rpm.avg != 0{
                self.rpm.avg = (self.rpm.avg + Double(self.rpm.last))/2
            } else {
                self.rpm.avg = Double(self.rpm.last)
            }
            self.rpm.velocityPrev = self.rpm.velocityLast  // First save the previous value
            print("Previos value of velocity: \(self.rpm.velocityPrev)")
            self.rpm.velocityLast = (self.toRadius * self.radius) * Double(self.rpm.last) // Then convert the new value => v = omega * R where omega converted to radiants per second
            print("Last value of velocity: \(self.rpm.velocityLast)")
        
            self.rpm.distance += (self.rpm.velocityLast * 60)/1000
            print("Value of distance: \(self.rpm.distance)")
            
            self.rpm.joule += 0.5 * self.weight * ((self.rpm.velocityLast*self.rpm.velocityLast) - (self.rpm.velocityPrev*self.rpm.velocityPrev))
            print("Value of joule: \(self.rpm.joule)")
            print("KCal in this minute: \(Int64(self.rpm.joule * self.toKCal))")
            self.rpm.kcal += Int64(self.rpm.joule * self.toKCal)
            print("Value of KCal: \(self.rpm.kcal)")
        }
        
        if (self.rpm.minute + 1 == 60) {
            self.rpm.minute = 0
            self.rpm.hour += 1
        }
        self.rpm.minute+=1
        print("Update OK\nRPM: \(self.rpm)")
    }    
}
