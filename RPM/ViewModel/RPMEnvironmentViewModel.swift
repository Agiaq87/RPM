//
//  RPMEnvironmentViewModel.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 27/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation
import SwiftUI

final class RPMEnvironmentViewModel: ObservableObject {
//    @Published var reader:RPMReader
    
    @Published var chartView:Bool = false
    @Published var referenceGy:Int = getReferenceGy()
    @Published var radius:String = String(getRadius())
 
    @Published var ID:String = getUserID()
    @Published var height:String = String(getUserHeight())
    @Published var weight:String = String(getUserWeight())
    @Published var goal:String = getGoal()
    
    @Published var errorSignal:Bool = false
    @Published var errorData:Bool = false
    @Published var errorType:String = ""
    @Published var errorMsg:String = ""
    
    @Published var allDataCollect:Bool = false

    @Published var currentView:Int = 0 // Refered to MotherView for display Welcome sequence
    
    @Published var settingsView:Bool = false
    
    @Published var standaloneMode:Bool = false
    @Published var standaloneCalibration:Bool = false
    
    @Published var externalMode:Bool = false
    
    
    
    init() {
//        self.reader = RPMReader(begin: 0, radius: 0, weight: 0)
        print("Environment ready")
    }
    
    public func update() -> Bool {
        setUserID(ID: self.ID)
        print("User ID set: \(self.ID)")
        
        guard Int(self.height) != nil else {
                   self.errorData = true
                   self.errorType = "Invalid height value"
                   self.errorMsg = "Express in cm your height value\nExample: 172"
                   return false
               }
        setUserHeight(height: Int(self.height) ?? 0)
        print("Height set: \(self.height)")
        
        self.weight = self.weight.replacingOccurrences(of: ",", with: ".")
        guard Double(self.weight) != nil else {
            self.errorData = true
            self.errorType = "Invalid weight value"
            self.errorMsg = "Express in Kg units your weight using dot notation\nSyntax: 85.5"
            return false
        }
        setUserWeight(weight: Double(self.weight) ?? 0.0)
        print("Weight set: \(self.weight)")
        
//        self.radius = self.radius.replacingOccurrences(of: ",", with: ".")
        guard Int(self.radius) != nil else {
            self.errorData = true
            self.errorType = "Invalid mm value"
            self.errorMsg = "Express in mm units your radius value\nExample: 175"
            return false
        }
        setRadius(radius: Int(self.radius) ?? 0)
        
        if (self.ID != "Name Surname") && (self.height != "0") && (self.weight != "0.0") && (self.radius != "0.0") {
            print("OK IF")
            self.allDataCollect = true
            self.errorData = false
        } else {
            print("NO IF")
            self.errorData = true
            self.errorType = "Inconsistent data"
            self.errorMsg = "Please inser all data"
            return false
        }
        
        print("Crank set\nAll data seems to saved correctly;\nTest: \(self.ID), \(self.height), \(self.weight), \(self.radius), \(self.allDataCollect)")
        return true
    }
    
    public func changeView() -> AnyView {
        print("\(self.currentView)")
        print("Retrive View")
        switch self.currentView {
        case 1: return AnyView(SimpleView(title: "CHOOSE",showNextButton: true))
        case 2: return AnyView(RideView())
        case 3: return AnyView(GaugeView())
        case 4: return AnyView(InsertUserDataView())
        case 5: return AnyView(FinalView())
        case 6: return AnyView(MainView())
        case 7: return AnyView(StandaloneCalibrationView())
        case 8: return AnyView(StandaloneView())
        case 9: return AnyView(ExternalBluetoothView())
        case 10:return AnyView(ExternalView())
        default:return AnyView(WelcomeView())
        }
    }
    
    public func updateGoal() {
        setGoal(value: self.goal)
        print("Goal update")
    }
    
}
