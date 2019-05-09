//
//  CoreDataStack.swift
//  TripStop
//
//  Created by Medi Assumani on 4/28/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreData
import Foundation


enum CoreDataFetchResult {
    case success([Trip])
    case failure(Error)
}


struct CoreDataStack {

    init() {}
    static let shared = CoreDataStack()
    
    lazy var mainContext: NSManagedObjectContext = {
        return self.peristentContainer.viewContext
    }()
    
    
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
    
    
    func createWaypoint() -> Waypoint{
        let newObject = NSEntityDescription.insertNewObject(forEntityName: "Waypoint", into: peristentContainer.viewContext) as! Waypoint
        
        return newObject
    }
    
    func delete(object: NSManagedObject) {
        
        peristentContainer.viewContext.delete(object)
        save()
    }
    
    func fetchSingleTrip() {
        
    }
    
//    func fetchWaypoints(from trip: Trip) {
//
//        //let predicate = NSPredicate(format: "<#T##String#>", <#T##args: CVarArg...##CVarArg#>)
//        let fetchRequest: NSFetchRequest<Waypoint> = Waypoint.fetchRequest()
//
//        fetchRequest.predicate = predicate
//    }
    
    func fetchTrips(completion: @escaping(CoreDataFetchResult) -> ()) {

        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        let viewContext = peristentContainer.viewContext

        do {
            let allTrips = try viewContext.fetch(fetchRequest)
            completion(.success(allTrips))
        } catch {
            completion(.failure(error))
        }
    }
}
