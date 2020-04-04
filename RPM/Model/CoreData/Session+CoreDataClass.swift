//
//  Session+CoreDataClass.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 08/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//
//

import Foundation
import CoreData


public class Session: NSManagedObject, Identifiable {
    @NSManaged public var date: String
    @NSManaged public var total: Int64
    @NSManaged public var max: Int16
    @NSManaged public var min: Int16
    @NSManaged public var avg: Double
    @NSManaged public var distance: Double
    @NSManaged public var velocity: Double  // Refer to average velocity
    @NSManaged public var kcal: Int64
    @NSManaged public var goal: String
    @NSManaged public var duration: String
    @NSManaged public var modality: String
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }
}
