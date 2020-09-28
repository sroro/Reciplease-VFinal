//
//  RecipeController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 02/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeController: UIViewController {
    var recipeSelected : Recipe?
    var favorite = false
    

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    @IBAction func tappedDirectionRecipe(_ sender: UIButton) {
        guard let url = URL(string: recipeSelected!.url)  else  { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImage.sd_setImage(with: URL(string: recipeSelected!.image), placeholderImage: UIImage(named: "image"))
    }
    
    
    @IBAction func favoriteTapButton(_ sender: UIButton) {
        
        favorite = !favorite
        print(favorite)
        // TODO - change 
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




