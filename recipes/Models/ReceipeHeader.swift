//
//  ReceipeDetail.swift
//  recipes
//
//  Created by Deanne Chance on 3/4/23.
//

import Foundation

struct Recipe : Codable {
    let meals: [RecipeHeader]?
}

struct RecipeHeader: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
