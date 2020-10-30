//
//  AppDelegate.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 26/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack(modelName: "Reciplease")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        coreDataStack.saveContext()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }

}

