//
//  Trip+CoreDataClass.swift
//  TripStop
//
//  Created by Medi Assumani on 4/30/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {


    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        name = "Unknowned Trip"
        waypoints = []
    }
}
