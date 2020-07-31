//
//  GroceryList + Convenience.swift
//  GroceryList35
//
//  Created by Todd Crandall on 7/31/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import Foundation
import CoreData

extension GroceryList {
    
    convenience init(groceryItem: String, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.groceryItem = groceryItem
        self.isComplete = isComplete
    }
}
