//
//  FavoriteRecipesController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 09/10/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import CoreData

class FavoriteRecipesController : UITableViewController {
    
    var coreDataManager : CoreDataManager?
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coreDataStack = appDelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coreDataStack)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager?.recipes.count ?? 0
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
}

