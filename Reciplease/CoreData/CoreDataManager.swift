//
//  CoreDataManager.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 06/10/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    // MARK: - Properties
    
    private let coreDataStack: CoreDataStack
    private let managedObjectContext: NSManagedObjectContext
    
    var recipes: [RecipeInformation] {
        let request: NSFetchRequest<RecipeInformation> = RecipeInformation.fetchRequest()
        guard let ingredients = try? managedObjectContext.fetch(request) else { return [] }
        return ingredients
    }
    
    
    // MARK: - Initializer
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = coreDataStack.mainContext
    }
    
    // MARK: - Manage Task Entity
    
    func createTask(name: String , calories: Double , time: String , ingredients: [String], url : String , image: Data?  ) {
        let recipe = RecipeInformation(context: managedObjectContext)
        recipe.name = name
        recipe.calories = calories
        recipe.time = time
        recipe.ingredients = ingredients
        recipe.url = url
        recipe.image = image
        coreDataStack.saveContext()
    }
    
    
    func isRecipeRegistered(name: String) -> Bool {
        // recuperer toutes les recettes
        let request: NSFetchRequest<RecipeInformation> = RecipeInformation.fetchRequest()
        //predicator ajoute un filtre a la requete
        request.predicate = NSPredicate(format: "name == %@", name)
        // execute la requete
        guard let recipes = try? managedObjectContext.fetch(request) else {
            return false
        }
        if recipes.isEmpty  {
            return false
        }
        return true
    }
    
    func deleteRecipe(name:String) {
        let request: NSFetchRequest<RecipeInformation> = RecipeInformation.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        guard let recipes = try? managedObjectContext.fetch(request) else { return }
        guard let recipe = recipes.first else { return }
        managedObjectContext.delete(recipe)
        coreDataStack.saveContext()
        
    }
    
    func deleteAllTasks() {
        recipes.forEach { managedObjectContext.delete($0) }
        coreDataStack.saveContext()
    }
  
}
