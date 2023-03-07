//
//  ReceipeDetailViewModel.swift
//  recipes
//
//  Created by Deanne Chance on 3/6/23.
//

import Foundation
public class RecipeDetailViewModel {
    
    let detail : RecipeDetail
    
    init(detail: RecipeDetail) {
        self.detail = detail
    }
    
    public var mealName : String {
        
        return detail.strMeal ?? ""
    }
    
    public var mealImageUrl: String {
        
        return detail.strMealThumb ?? ""
    }
    
    public var instructions: String {
        return detail.strInstructions ?? ""
    }
}
