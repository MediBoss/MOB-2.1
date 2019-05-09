//
//  Trip+CoreDataClass.swift
//  TripStop
//
//  Created by Medi Assumani on 5/8/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
    var waypoints: [Waypoint]? {
        return self.waypoint?.array as? [Waypoint]
    }
}
