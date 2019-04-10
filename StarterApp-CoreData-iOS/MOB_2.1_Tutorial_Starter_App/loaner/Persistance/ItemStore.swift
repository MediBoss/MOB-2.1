//
//  ItemStore.swift
//  loaner
//
//  Created by Medi Assumani on 4/9/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import CoreData

enum FetchItemsResult {
    case success([Item])
    case failure(Error)
}

class ItemStore: NSObject {
    
    static let shared = ItemStore()
    
    let persistentContainer: NSPersistentContainer = {
        // creates the NSPersistentContainer object
        // must be given the name of the Core Data model file “LoanedItems”
        let container = NSPersistentContainer(name: "LoanedItems")
        
        // load the saved database if it exists, creates it if it does not, and returns an error under failure conditions
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    // MARK: - Save Core Data Context
    public func saveContext() {
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public func create() -> Item{
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "Item", into: persistentContainer.viewContext) as! Item
        
        return newItem
    }
    
    func delete(object: NSManagedObject){
        
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
    
    func fetchPersistedData(completion: @escaping (FetchItemsResult) -> Void) {
        
        // creates  a fetch request object and grab the view context
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let viewContext = persistentContainer.viewContext
        
        do {
            // fetches all the managed objects of type Item from the store
            let allItems = try viewContext.fetch(fetchRequest)
            completion(.success(allItems))
        } catch {
            completion(.failure(error))
        }
    }
}
