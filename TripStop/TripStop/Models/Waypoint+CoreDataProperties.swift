//
//  Waypoint+CoreDataProperties.swift
//  TripStop
//
//  Created by Medi Assumani on 4/30/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import CoreLocation
import CoreData
import Foundation


extension Waypoint {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Waypoint> {
        return NSFetchRequest<Waypoint>(entityName: "Waypoint")
    }

    @NSManaged public var name: String
    @NSManaged public var coordinates: CLLocationCoordinate2D
    @NSManaged public var trip: Trip

}
