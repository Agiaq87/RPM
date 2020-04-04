//
//  RPMCompass.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import CoreLocation
import Combine

final class CompassManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }
    
    private let locationManager: CLLocationManager
    
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func getLocationManager() -> CLLocationManager {
        return self.locationManager
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.degrees = newHeading.trueHeading
    }
    
    func getDegrees() -> String {
        return String(format: "%.0f", self.degrees)
    }
}

struct Compass: View {
    let marker: Marker
    let compassDegress: Double
    
    @ObservedObject var controller = CompassManager()

    var body: some View {
        VStack {
//            Text(marker.degreeText())
//                .font(.footnote)
//                .fontWeight(.bold)
//                    .rotationEffect(self.textAngle())

            Capsule()
                    .frame(width: self.capsuleWidth(),
                            height: self.capsuleHeight())
                    .foregroundColor(Color.red)
                    .padding(.bottom, 20)

            Text(marker.label)
                .fontWeight(.bold)
                    .rotationEffect(self.textAngle())
                    .padding(.bottom, 20)
        }.rotationEffect(Angle(degrees: marker.degrees))
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.degrees == 0 ? 1 : 0
    }
    
    private func capsuleHeight() -> CGFloat {
        return self.marker.degrees == 0 ? 40 : 30
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.degrees)
    }
}

//struct Compass_Previews: PreviewProvider {
//    static var previews: some View {
//        Compass()
//    }
//}
