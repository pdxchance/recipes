//
//  RecipeService.swift
//  recipes
//
//  Created by Deanne Chance on 3/4/23.
//

import Foundation

typealias headerCompletionHandler = ([RecipeHeader]) -> Void
typealias detailCompletionHandler = (RecipeDetail) -> Void

class RecipeService {
    
    private let session = URLSession.shared
    
    func getMealHeaders(category: String, completion: @escaping headerCompletionHandler) {
        
        var receipeHeaders : [RecipeHeader] = []
        
        let url = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=" + category)!
        
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
                            
                            receipeHeaders.append(item)
                        }
                        
                        
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
            
            let sortedList = receipeHeaders.sorted { $0.strMeal ?? "" < $1.strMeal ?? "" }
            
            completion(sortedList)
            
        })
        task.resume()
        
    }
    
    func getMealDetail(mealId: String, completion: @escaping detailCompletionHandler) {
        
        let url = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealId)!
        
        let task = session.dataTask(with: url, completionHandler: { [weak self]  (data, response, error) in
            
            do {
                guard let self = self, let data = data else { return }
                
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try? JSONDecoder().decode(RecipeDetails.self, from: data) {
                        
                        if let meal = json.meals?[0] {
                            completion(meal)
                        }
                        
                    }
                }
                catch let error as NSError {
                    print(error)
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
            }
            
            
            //completion(sortedList)
            
        })
        task.resume()
        
        
    }
}
