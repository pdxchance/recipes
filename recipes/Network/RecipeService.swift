//
//  RecipeService.swift
//  recipes
//
//  Created by Deanne Chance on 3/4/23.
//

import Foundation


typealias headerCompletionHandler = ([RecipeHeader]) -> Void


class RecipeService {
    
    var recipes : [RecipeHeader] = []
    
    private let session = URLSession.shared
        
    func getMealHeaders(completion: @escaping headerCompletionHandler) {
        
        
        
        let url = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        let task = session.dataTask(with: url, completionHandler: { [weak self]  (data, response, error) in
            
            do {
                guard let self = self, let data = data else { return }
                                
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        
                        let meals = json["meals"] as! [[String:Any]]
                        
                        for meal in meals {
                            
                            let strMeal = meal["strMeal"] as! String
                            
                            let strMealThumb = meal["strMealThumb"] as! String
                            
                            let mealId = meal["idMeal"] as! String
                            
                            let item = RecipeHeader(strMeal: strMeal, strMealThumb: strMealThumb, idMeal: mealId)
                            
                        
                            self.recipes.append(item)
                        }
                        
                
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
            
            let recipes = self?.recipes ?? []
            completion(recipes)

        })
        task.resume()
    }
    
    
    
    
    
    
}
