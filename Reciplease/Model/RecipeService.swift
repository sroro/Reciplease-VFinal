////
////  RecipeJSON.swift
////  Reciplease
////
////  Created by Rodolphe Schnetzer on 28/08/2020.
////  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
////
//
//import Foundation
//
//
//// MARK: - Welcome
//struct RecipeJSON: Decodable {
//    let q: String
//    let from, to: Int
//    let more: Bool
//    let count: Int
//    let hits: [Hit]
//}
//
//// MARK: - Hit
//struct Hit: Decodable {
//    let recipe: Recipe
//    let bookmarked, bought: Bool
//}
//
//// MARK: - Recipe
//struct Recipe: Decodable {
//    let label: String
//    let image: String
//    let url: String
//    let ingredientLines: [String]
//    let ingredients: [Ingredients]
//    let calories: Double
//    let totalTime: Int
//}
//
//enum Unit: String, Decodable {
//    case g = "g"
//    case kcal = "kcal"
//}
//
//// MARK: - Ingredient
//struct Ingredients: Decodable {
//    let text: String
//    let weight: Double
//    let image: String?
//}

import Foundation

// MARK: - WeatherData
struct RecipeJSON: Codable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels, healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Double
    let totalTime: Int
    let cuisineType, mealType, dishType: [String]
    let totalNutrients, totalDaily: [String: Total]
    let digest: [Digest]
}

// MARK: - Digest
struct Digest: Codable {
    let label, tag: String
    let schemaOrgTag: String?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory, foodID: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

// MARK: - Total
struct Total: Codable {
    let label: String
    let quantity: Double
    let unit: Unit
}


enum RecipeError: Error {
    case noData, incorrectResponse, undecodable
}

//MARK: - class Request Service
final class RequestService {
    
    private let session: Alamo
    
    init (session: Alamo = DataReciplease()){
        self.session = session
    }
    
    func getData(ingredient: String ,callback: @escaping (Result<RecipeJSON, Error>) -> Void) {
        guard let url = URL(string: "https://api.edamam.com/search?q=\(ingredient)&app_id=d4ca1968&app_key=b9eb6ef419398c1454c809899be163c6&from=0&to=10") else { return }
        session.request(with: url) { (responseData) in
            guard let data = responseData.data else {
                callback(.failure(RecipeError.noData))
                return
            }
            guard responseData.response?.statusCode == 200 else {
                callback(.failure(RecipeError.incorrectResponse))
                return
            }
            guard let response = try? JSONDecoder().decode(RecipeJSON.self, from: data) else {
                callback(.failure(RecipeError.undecodable))
                return
            }
            callback(.success(response))
        }
        
    }
    
}

// création d'un type pour stocker les recttes de l'appel reseau et des favoris
struct RecipeDetails {
    let name : String
    let url : String
    let time : String
    let ingredients : [String]
    let image : Data?
    let calories : Double
   
}
