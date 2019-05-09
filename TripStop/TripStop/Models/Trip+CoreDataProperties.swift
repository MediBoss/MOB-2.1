//
//  Trip+CoreDataProperties.swift
//  TripStop
//
//  Created by Medi Assumani on 5/8/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var name: String?
    @NSManaged public var waypoint: NSOrderedSet?

}

// MARK: Generated accessors for waypoint
extension Trip {

    @objc(addWaypointObject:)
    @NSManaged public func addToWaypoint(_ value: Waypoint)

    @objc(removeWaypointObject:)
    @NSManaged public func removeFromWaypoint(_ value: Waypoint)

    @objc(addWaypoint:)
    @NSManaged public func addToWaypoint(_ values: NSSet)

    @objc(removeWaypoint:)
    @NSManaged public func removeFromWaypoint(_ values: NSSet)

}
