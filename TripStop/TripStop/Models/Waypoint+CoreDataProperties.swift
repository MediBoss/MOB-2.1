//
//  Waypoint+CoreDataProperties.swift
//  TripStop
//
//  Created by Medi Assumani on 5/8/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import Foundation
import CoreData


extension Waypoint {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Waypoint> {
        return NSFetchRequest<Waypoint>(entityName: "Waypoint")
    }

    @NSManaged public var name: String
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var trip: Trip

}
