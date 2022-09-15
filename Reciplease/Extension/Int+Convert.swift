//
//  Convert.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 09/11/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import Foundation

extension Int {
    
    var convert : String {
        if self == 0 {
            return "no time"
        }
        let convertTime = String(self)
        return ("\(convertTime) mins")
    }
}

extension Double {
    var convertDoubleToString : String {
        let convertCalories = NumberFormatter()
        convertCalories.maximumIntegerDigits = 5
        guard let caloriesFormated = convertCalories.string(from: NSNumber(value: self )) else {return ""}
        return ("\(caloriesFormated) Kcal")
    }

}

