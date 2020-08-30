//
//  RecipeJSON.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 28/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct RecipeJSON: Decodable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Decodable {
    let recipe: Recipe
    let bookmarked, bought: Bool
}

// MARK: - Recipe
struct Recipe: Decodable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url, shareAs: String
    let yield: Int
    let healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredients]
    let totalTime: Int
    let totalNutrients, totalDaily: [String: Total]
    let digest: [Digest]
}

// MARK: - Digest
struct Digest: Decodable {
    let label, tag: String
    let schemaOrgTag: String?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?
}

enum Unit: String, Decodable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - Ingredient
struct Ingredients: Decodable {
    let text: String
    let weight: Double
    let image: String?
}

// MARK: - Total
struct Total: Decodable {
    let label: String
    let quantity: Double
    let unit: Unit
}

enum RecipeError: Error {
    case noData, incorrectResponse, undecodable
}
