//
//  Waypoint+CoreDataClass.swift
//  TripStop
//
//  Created by Medi Assumani on 4/30/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import CoreData
import CoreLocation
import Foundation

@objc(Waypoint)
public class Waypoint: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        name = "Unknowed Waypoint"
        coordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
}
