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
    var recipeDetails : RecipeDetails?
    var recipeInformation : RecipeInformation?
    
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeInformation = coreDataManager?.recipes[indexPath.row]
        performSegue(withIdentifier: "segueFavoriteToRecipe", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recipeInformation = recipeInformation else { return }
        if segue.identifier == "segueFavoriteToRecipe" {
            let successVC = segue.destination as! RecipeController
            let recipeDetails = RecipeDetails(name: recipeInformation.name!, url: recipeInformation.url!, time: recipeInformation.time!, ingredients: recipeInformation.ingredients!, image: recipeInformation.image!)
            successVC.recipeDetails = recipeDetails
        }
    }
    
}


// revenir en arriere quand on enleve la recette des favoris
