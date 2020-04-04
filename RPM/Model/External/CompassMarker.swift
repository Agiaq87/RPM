//
//  CompassMarker.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation

struct Marker: Hashable {
    let degrees: Double
    let label: String

    init(degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }
    
    static func markers() -> [Marker] {
        return [
            Marker(degrees: 0, label: "S"),
            Marker(degrees: 45),
            Marker(degrees: 90, label: "W"),
            Marker(degrees: 135),
            Marker(degrees: 180, label: "N"),
            Marker(degrees: 225),
            Marker(degrees: 270, label: "E"),
            Marker(degrees: 315)
        ]
    }
    
    func degreeText() -> String {
        return String(format: "%.0f", self.degrees)
    }
}
