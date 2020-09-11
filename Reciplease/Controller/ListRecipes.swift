//
//  ListRecipes.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 27/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

class ListRecipes: UITableViewController{
    
    var infoRecipes : RecipeJSON?
    
    @IBOutlet var listRecipesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // utilsier la cellule personnalisé .xib
        listRecipesTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "recipeCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoRecipes?.hits.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listRecipesTableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else { return UITableViewCell() }
        let recipes = infoRecipes?.hits
        guard let recipe = recipes?[indexPath.row].recipe else { return UITableViewCell() }
        cell.configure(titleRecipe: recipe.label, ingredient: recipe.ingredients.map {$0.text}.joined(separator: ", "), timeRecipe: "\(recipe.totalTime)", caloriesRecipe: formatResult(result: recipe.calories), recipeIm: recipe.image)
        return cell
    }
    
    // height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToRecipe", sender: nil)
        print(indexPath.row)
    }
    
    
    func formatResult(result: Double) -> String! {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        guard let resultFormated = formatter.string(from: NSNumber(value: result)) else { return nil
        }
        return resultFormated
    }
 
}




