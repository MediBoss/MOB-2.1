//
//  CoreDataStack.swift
//  TripStop
//
//  Created by Medi Assumani on 4/28/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreData
import Foundation

struct CoreDataStack {
    
    static let peristentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "userTrips")
        
        return container
    }()
}
