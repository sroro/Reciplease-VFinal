//
//  MockCoreDataStack.swift
//  RecipleaseTests
//
//  Created by Rodolphe Schnetzer on 28/01/2021.
//  Copyright © 2021 Rodolphe Schnetzer. All rights reserved.
//

import Foundation
import Reciplease
import CoreData

final class MockCoreDataStack: CoreDataStack {

    // MARK: - Initializer

    convenience init() {
        self.init(modelName: "Reciplease")
    }

    override init(modelName: String) {
        super.init(modelName: modelName)
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        let container = NSPersistentContainer(name: modelName)
        container.persistentStoreDescriptions = [persistentStoreDescription]
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        self.persistentContainer = container
    }
}
