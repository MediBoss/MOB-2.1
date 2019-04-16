//
//  Trip.swift
//  TripStop
//
//  Created by Medi Assumani on 4/16/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation

struct Trip {
    
    var name: String?
    var waypoints: [Waypoint]?
    
    init(name: String){
        self.name = name
        self.waypoints = nil
    }
}
