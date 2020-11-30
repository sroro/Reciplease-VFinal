//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 31/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var timeRecipeLabel: UILabel!
    @IBOutlet weak var caloriesRecipeLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    var recipe : Recipe? {
        didSet{
            titleRecipeLabel.text = recipe?.label
            ingredientLabel.text = recipe?.ingredientLines.joined(separator: " ")
            timeRecipeLabel.text = recipe?.totalTime.convert
            caloriesRecipeLabel.text = recipe?.calories.convertDoubleToString
            recipeImage.sd_setImage(with: URL(string: recipe!.image), placeholderImage: UIImage(named: "image"))
            
            
        }
    }
    
    var recipeFavorite : RecipeInformation? {
        didSet{
            titleRecipeLabel.text = recipeFavorite?.name
            timeRecipeLabel.text =  recipeFavorite?.time
            ingredientLabel.text = recipeFavorite?.ingredients?.joined(separator: " ")
            caloriesRecipeLabel.text = recipeFavorite?.calories.convertDoubleToString
            guard let imageData = recipeFavorite?.image else { return }
            //convert image data to UIImage
            let image = UIImage(data: imageData)
            recipeImage.image = image
        }
    }
}
