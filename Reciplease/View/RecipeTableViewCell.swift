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
    
    var recipe : Recipe? {
        didSet{
            titleRecipeLabel.text = recipe?.label
            ingredientLabel.text = recipe?.ingredientLines.joined(separator: " ")
            timeRecipeLabel.text = convertToString(time: (recipe?.totalTime)!)
            caloriesRecipeLabel.text = convertDoubleToString(test: (recipe?.calories)!)
            recipeImage.load(url: URL(string: recipe!.image)!)
        }
    }
    
    func convertToString(time: Int) -> String{
        if time == 0 {
            return "no time"
        }
        let convertTime = String(time)
        return ("\(convertTime) mins")
    }
    
    func convertDoubleToString(test: Double) -> String! {
        let convertCalories = NumberFormatter()
        convertCalories.maximumIntegerDigits = 5
        guard let caloriesFormated = convertCalories.string(from: NSNumber(value: test)) else {return nil}
        return ("\(caloriesFormated) Kcal")
 
    }
//
//    func configure(titleRecipe: String, ingredient: String, timeRecipe: String, caloriesRecipe: String, recipeIm: String){
//
//        titleRecipeLabel.text = titleRecipe
//        ingredientLabel.text = ingredient
//        timeRecipeLabel.text = ("\(timeRecipe) min")
//        caloriesRecipeLabel.text = ("\(caloriesRecipe) Kcal")
//        guard let imageUrl = URL(string: recipeIm) else { return }
//        recipeImage.load(url: imageUrl)
//    }
    

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


