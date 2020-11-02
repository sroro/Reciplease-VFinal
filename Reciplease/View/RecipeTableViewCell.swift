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
            timeRecipeLabel.text = convertToString(time: (recipe?.totalTime) ?? 0)
            caloriesRecipeLabel.text = convertDoubleToString(string: (recipe?.calories) ?? 0)
            recipeImage.sd_setImage(with: URL(string: recipe!.image), placeholderImage: UIImage(named: "image"))
        }
    }
    
    var recipeFavorite : RecipeInformation? {
        didSet{
            titleRecipeLabel.text = recipeFavorite?.name
            timeRecipeLabel.text =  recipeFavorite?.time
            caloriesRecipeLabel.text = convertDoubleToString(string: recipeFavorite?.calories ?? 0)
            
            
        }
    }
    
    func convertToString(time: Int) -> String{
        if time == 0 {
            return "no time"
        }
        let convertTime = String(time)
        return ("\(convertTime) mins")
    }
    
    func convertDoubleToString(string: Double) -> String { // changer nom parametre
        let convertCalories = NumberFormatter()
        convertCalories.maximumIntegerDigits = 5
        guard let caloriesFormated = convertCalories.string(from: NSNumber(value: string)) else {return ""}
        return ("\(caloriesFormated) Kcal")
 
    }

}
