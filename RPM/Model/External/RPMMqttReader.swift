//
//  RPMMqttReader.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 16/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation


final class RPMMqttReader: RPMReader {
    
    override init(begin counted: Int16, radius: Int, weight: Double) {
        super.init(begin: counted, radius: radius, weight: weight)
    }
}
