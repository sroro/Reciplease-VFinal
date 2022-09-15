//
//  CoreDataManagerTests.swift
//  RecipleaseTests
//
//  Created by Rodolphe Schnetzer on 28/01/2021.
//  Copyright © 2021 Rodolphe Schnetzer. All rights reserved.
//

import XCTest
import CoreData
@testable import Reciplease

class CoreDataManagerTests: XCTestCase {

    // MARK: - Properties

    var coreDataStack: MockCoreDataStack!
    var coreDataManager: CoreDataManager!
    let data = Data("https://www.edamam.com/web-img/9c4/9c42e4c658b8e1c8d71946d71d48813a.jpg".utf8)

    //MARK: - Tests Life Cycle

    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        coreDataManager = CoreDataManager(coreDataStack: coreDataStack)
    }

    override func tearDown() {
        super.tearDown()
        coreDataManager = nil
        coreDataStack = nil
    }
    
    func testAddTeskMethods_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
        coreDataManager.createTask(name: "chicken salad", calories: 10.0, time: "2", ingredients: ["chicken,cheese"], url: "www.edanam.org", image: data  )
        XCTAssertTrue(!coreDataManager.recipes.isEmpty)
        XCTAssertTrue(coreDataManager.recipes[0].name == "chicken salad")
        XCTAssertTrue(coreDataManager.recipes[0].calories == 10.0 )
        XCTAssertTrue(coreDataManager.recipes[0].time == "2")
        XCTAssertTrue(coreDataManager.recipes[0].ingredients == ["chicken,cheese"])
        XCTAssertTrue(coreDataManager.recipes[0].url == "www.edanam.org")
        XCTAssertTrue(coreDataManager.recipes[0].image == data )
        
    }
    
    func testDeleteRecipes_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
        coreDataManager.createTask(name: "chicken salad", calories: 10.0, time: "2", ingredients: ["chicken,cheese"], url: "www.edanam.org", image: data )
        coreDataManager.deleteRecipe(name: "chicken salad")
        XCTAssertTrue(coreDataManager.recipes.isEmpty)
    }
    
    
    func testDeleteRecipes_WhenManyEntityIsCreated_ThenShouldBeCorrectlySaved() {
        coreDataManager.createTask(name: "chicken salad", calories: 10.0, time: "2", ingredients: ["chicken,cheese"], url: "www.edanam.org", image: data )
        coreDataManager.createTask(name: "chicken salad", calories: 10.0, time: "2", ingredients: ["chicken,cheese"], url: "www.edanam.org", image: data )
        coreDataManager.deleteAllTasks()
        XCTAssertTrue(coreDataManager.recipes.isEmpty)
    }
    
    func testRegisteredRecipes_WhenEntityEntityIsCreated_ThenShouldBeCorrectlyRegistered() {
        coreDataManager.createTask(name: "chicken salad", calories: 10.0, time: "2", ingredients: ["chicken,cheese"], url: "www.edanam.org", image: data )
        let isRegistered = coreDataManager.isRecipeRegistered(name: "chicken salad")
        XCTAssertTrue(isRegistered)
       
        
  
    }

}
