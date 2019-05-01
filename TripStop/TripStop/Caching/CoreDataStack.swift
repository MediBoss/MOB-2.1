//
//  CoreDataStack.swift
//  TripStop
//
//  Created by Medi Assumani on 4/28/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreData
import Foundation


enum FetchWaypointResult {
    case success([Waypoint])
    case failure(Error)
}

enum fetchTripsResult {
    case success([Trip])
    case failure(Error)
}

struct CoreDataStack {
    
    static let shared = CoreDataStack()
    
    let peristentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "userTrips")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                print(error)
            }
        })
        
        return container
    }()
    
    
    func save() {
        
        let context = peristentContainer.viewContext
        if context.hasChanges {
            
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func create() -> Trip {
        
        let newObject = NSEntityDescription.insertNewObject(forEntityName: "Trip", into: peristentContainer.viewContext) as! Trip
        
        return newObject
    }
    
    func delete(object: NSManagedObject) {
        
        peristentContainer.viewContext.delete(object)
        save()
    }
    
    
    func fetchWaypoints(completion:@escaping(FetchWaypointResult) -> ()) {
        
        let fetchRequest: NSFetchRequest<Waypoint> = Waypoint.fetchRequest()
        let viewContext = peristentContainer.viewContext
        
        do {
            let allWaypoints = try viewContext.fetch(fetchRequest)
            completion(.success(allWaypoints))
        } catch {
            completion(.failure(error))
        }
    }
    
    func fetchTrips(completion:@escaping(fetchTripsResult) -> ()) {
        
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        let viewContext = peristentContainer.viewContext
        
        do {
            let allWaypoints = try viewContext.fetch(fetchRequest)
            completion(.success(allWaypoints))
        } catch {
            completion(.failure(error))
        }
    }
}
