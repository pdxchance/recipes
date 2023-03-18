//
//  RecipeViewModel.swift
//  recipes
//
//  Created by Deanne Chance on 3/4/23.
//

import Foundation
import UIKit

public class RecipeHeaderViewModel {
    
    let header : RecipeHeader
    
    init(header: RecipeHeader) {
        self.header = header
    }
    
    public var mealName : String {
        
        return header.strMeal ?? ""
    }
    
    public var mealImageUrl: String {
        
        return header.strMealThumb ?? ""
        
    }
    
    public var mealId: String {
        
        return header.idMeal ?? ""
    }
}
