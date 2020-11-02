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

    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "recipeCell")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coreDataStack = appDelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coreDataStack)
    }
    
    // permet de recharger la tableview une fois une new recette ajouter
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager?.recipes.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //création cellule
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else { return UITableViewCell() }
        guard let recipeFavorite = coreDataManager?.recipes[indexPath.row] else { return UITableViewCell() }
        // affecte les recettes aux cellules
        cell.recipeFavorite = recipeFavorite
        return cell
    }
    
    
}

