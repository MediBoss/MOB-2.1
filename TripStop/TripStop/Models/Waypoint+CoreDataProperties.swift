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
    @NSManaged public var coordinates: CustomCoordinates
    @NSManaged public var trip: Trip
}

public class CustomCoordinates: NSObject, NSCoding{
    
    var lon: Double
    var lat: Double
    
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(lon, forKey: "longitude")
        aCoder.encode(lat, forKey: "latitude")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        lon = aDecoder.decodeObject(forKey: "longitude") as! Double
        lat = aDecoder.decodeObject(forKey: "latitude") as! Double
        super.init()
    }

}
