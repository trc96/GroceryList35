//
//  CoreDataStack.swift
//  GroceryList35
//
//  Created by Todd Crandall on 7/31/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GroceryList35")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext }
}
