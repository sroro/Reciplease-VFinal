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
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBAction func getDirectionsButton(_ sender: Any) {
    }
    
}

extension RecipeController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientRecipeCell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
        
    }
   
}



