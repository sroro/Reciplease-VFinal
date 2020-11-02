//
//  ListRecipes.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 27/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

class ListRecipes: UITableViewController{
    
    var recipeSelected : Recipe?
    var recipes : [Hit]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // utilsier la cellule personnalisé .xib
        tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "recipeCell")
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else { return UITableViewCell() }
        guard let recipe = recipes?[indexPath.row].recipe else { return UITableViewCell() }
        cell.recipe = recipe
        return cell
    }
    
    // height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeSelected = recipes?[indexPath.row].recipe // stock la recette selectionner par la cellule
        performSegue(withIdentifier: "segueToRecipe", sender: nil)
        
    } 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToRecipe" {
            let vcDestination = segue.destination as? RecipeController
            vcDestination?.recipeSelected = recipeSelected
        }
    }
}




