//
//  RecipeService.swift
//  recipes
//
//  Created by Deanne Chance on 3/4/23.
//

import Foundation

typealias HeaderCompletionHandler = ([RecipeHeaderViewModel]?) -> Void
typealias DetailCompletionHandler = (RecipeDetailViewModel?) -> Void

class RecipeService {
    
    private let session = URLSession.shared
    
    func getMealHeaders(category: String, completion: @escaping HeaderCompletionHandler) {
        
        var viewModels : [RecipeHeaderViewModel] = []
        
        let url = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=" + category)!
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let data = data else { return completion(nil) }
            
            let json = try? JSONDecoder().decode(Recipe.self, from: data)
            
            if let payload = json?.meals {
                
                let sortedList = payload.sorted {
                    
                    guard let a = $0.strMeal, let b = $1.strMeal else { return false }
                    
                    return a < b
                }
                
                for header in sortedList {
                    let vm = RecipeHeaderViewModel(header: header)
                    viewModels.append(vm)
                }
                completion(viewModels)
            }
            completion(nil)
        })
        task.resume()
    }
    
    func getMealDetail(mealId: String, completion: @escaping DetailCompletionHandler) {
        
        let url = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealId)!
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            do {
                guard let data = data else { return completion(nil) }
                
                let json = try? JSONDecoder().decode(RecipeDetails.self, from: data)
                
                if let payload = json?.meals?[0] {
                    let vm = RecipeDetailViewModel(detail: payload)
                    completion(vm)
                }
            }
            completion(nil)
            
        })
        task.resume()
    }
}
