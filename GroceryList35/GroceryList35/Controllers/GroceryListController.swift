//
//  GroceryListController.swift
//  GroceryList35
//
//  Created by Todd Crandall on 7/31/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import Foundation
import CoreData

class GroceryListController {
    
    //MARK: - sharedInstance
    static let sharedInstance = GroceryListController()
    
    //MARK: - Properties
    let fetchedResultsController: NSFetchedResultsController<GroceryList> = {
        
        let fetchRequest: NSFetchRequest<GroceryList> = GroceryList.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "groceryItem", ascending: false)]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "groceryItem", cacheName: nil)
    }()
    
    init() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    //MARK: - CRUD
    //create
    func createItem(groceryItem: String) {
        _ = GroceryList(groceryItem: groceryItem)
        saveToPersistentStore()
    }
    
    //update
    func updateItem(groceryItem: GroceryList) {
        groceryItem.isComplete = !groceryItem.isComplete
        saveToPersistentStore()
    }
    
    //Remove
    func removeItem(groceryItem: GroceryList) {
        let moc = CoreDataStack.context
        moc.delete(groceryItem)
        saveToPersistentStore()
    }
    
    //MARK: - Perstitence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
