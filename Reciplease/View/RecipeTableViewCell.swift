//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 31/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    var recipe : Recipe!
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var timeRecipeLabel: UILabel!
    @IBOutlet weak var caloriesRecipeLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
     
    func configure(titleRecipe: String, ingredient: String, timeRecipe: String, caloriesRecipe: String, recipeIm: String){
        
        titleRecipeLabel.text = titleRecipe
        ingredientLabel.text = ingredient
        timeRecipeLabel.text = ("\(timeRecipe) min")
        caloriesRecipeLabel.text = ("\(caloriesRecipe) Kcal")
        //guard let imageUrl = URL(string: recipe.image) else { return }
        
        
     
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            // Create data from url
            if let data = try? Data(contentsOf: url) {
                // Create image from data
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


