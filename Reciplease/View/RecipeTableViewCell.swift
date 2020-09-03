//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 31/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

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
        recipeImage.image = UIImage(named: recipeIm)
    }
    
}
