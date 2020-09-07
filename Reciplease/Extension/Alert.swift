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
}
