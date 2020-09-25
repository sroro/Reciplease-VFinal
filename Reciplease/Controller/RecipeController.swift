//
//  RecipeController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 02/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import CoreData

class RecipeController: UIViewController {
    var recipeSelected : Recipe?
    var favorite = false
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    @IBAction func getDirectionsButton(_ sender: Any) {
        if let url = URL(string: recipeSelected!.shareAs) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            print(url)
        }
    }
    
    @IBAction func favoriteTapButton(_ sender: Any) {
      
    }
    
    
}

extension RecipeController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeSelected!.ingredientLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientRecipeCell", for: indexPath)
        guard let ingredientsRecipe = recipeSelected?.ingredients[indexPath.row].text else { return UITableViewCell() }
        cell.textLabel?.text = ingredientsRecipe
        return cell
    }
    
    
   
}




