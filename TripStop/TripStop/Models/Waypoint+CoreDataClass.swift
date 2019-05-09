//
//  Waypoint+CoreDataClass.swift
//  TripStop
//
//  Created by Medi Assumani on 5/8/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Waypoint)
public class Waypoint: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        name = "Unknowed Waypoint"
        longitude = 0.0
        latitude = 0.0
    }
}
