//
//  Alert.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 06/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

extension  UIViewController {
    /// alert no recipes found
    func alertError() {
        let alertVC = UIAlertController(title: "Error", message: "No Recipes Found", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true , completion: nil)
    }
    
    /// alert no ingredient add
    func alertAddIngredient() {
        let alertVC = UIAlertController(title: "Error", message: "Add ingredients", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true , completion: nil)
    }
    
    func alertAddRecipeFavorite() {
        let alertVC = UIAlertController(title: "HAPPY MEAL", message: "Recipe Add in Favorite", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true , completion: nil)
    }
    
    func alertDeleteRecipeFavorite() {
        let alertVC = UIAlertController(title: "No", message: "Recipe Delete of Favorite", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true , completion: nil)
    }
    
    
}
