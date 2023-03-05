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
    
    public var mealImage: UIImage? {
                
        let url = URL(string: header.strMealThumb ?? "")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        return UIImage(data: data!)
    }
}
