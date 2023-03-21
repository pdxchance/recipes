//
//  IngredentsViewModel.swift
//  recipes
//
//  Created by Deanne Chance on 3/18/23.
//

import Foundation

struct IngredentsViewModel {
    
    let meal : RecipeDetail
    
    init(meal: RecipeDetail) {
        self.meal = meal
    }
    
    public var ingredients : [String] {
        
        var allEntries = ["":""]
      
        if let ingr1 = meal.strIngredient1, let measure1 = meal.strMeasure1 {
            
            allEntries[ingr1] = measure1

        }
        
        if let ingr2 = meal.strIngredient2, let measure2 = meal.strMeasure2 {
            
            allEntries[ingr2] = measure2

        }
        
        if let ingr3 = meal.strIngredient3, let measure3 = meal.strMeasure3 {
            
            allEntries[ingr3] = measure3

        }
        
        if let ingr4 = meal.strIngredient4, let measure4 = meal.strMeasure4 {
            
            allEntries[ingr4] = measure4

        }
        
        
        if let ingr5 = meal.strIngredient5, let measure5 = meal.strMeasure5 {
            
            allEntries[ingr5] = measure5

        }
        
        if let ingr6 = meal.strIngredient6, let measure6 = meal.strMeasure6 {
            
            allEntries[ingr6] = measure6

        }
        
        if let ingr7 = meal.strIngredient7, let measure7 = meal.strMeasure7 {
            
            allEntries[ingr7] = measure7

        }
        
        
        if let ingr8 = meal.strIngredient8, let measure8 = meal.strMeasure8 {
            
            allEntries[ingr8] = measure8

        }
        
        
        if let ingr9 = meal.strIngredient9, let measure9 = meal.strMeasure9 {
            
            allEntries[ingr9] = measure9

        }
        
        
        if let ingr10 = meal.strIngredient10, let measure10 = meal.strMeasure10 {
            
            allEntries[ingr10] = measure10

        }
        
        if let ingr11 = meal.strIngredient11, let measure11 = meal.strMeasure11 {
            
            allEntries[ingr11] = measure11

        }
        
        if let ingr12 = meal.strIngredient12, let measure12 = meal.strMeasure12 {
            
            allEntries[ingr12] = measure12

        }
        
        if let ingr13 = meal.strIngredient13, let measure13 = meal.strMeasure13 {
            
            allEntries[ingr13] = measure13

        }
        
        if let ingr14 = meal.strIngredient14, let measure14 = meal.strMeasure14 {
            
            allEntries[ingr14] = measure14

        }
        
        
        if let ingr15 = meal.strIngredient15, let measure15 = meal.strMeasure15 {
            
            allEntries[ingr15] = measure15

        }
        
        if let ingr16 = meal.strIngredient16, let measure16 = meal.strMeasure16 {
            
            allEntries[ingr16] = measure16

        }
        
        if let ingr17 = meal.strIngredient17, let measure17 = meal.strMeasure17 {
            
            allEntries[ingr17] = measure17

        }
        
        
        if let ingr18 = meal.strIngredient18, let measure18 = meal.strMeasure18 {
            
            allEntries[ingr18] = measure18

        }
        
        
        if let ingr19 = meal.strIngredient19, let measure19 = meal.strMeasure19 {
            
            allEntries[ingr19] = measure19

        }
        
        
        if let ingr20 = meal.strIngredient20, let measure20 = meal.strMeasure20 {
            
            allEntries[ingr20] = measure20

        }
        var flatData : [String] = []
        
        for entry in allEntries {
            if entry.key != "" {
                let measure = entry.key
                let ingredent = entry.value
                let compact = ingredent + " " + measure
                flatData.append(compact)
            }
        }

        return flatData
    }
    
    
}


