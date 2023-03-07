//
//  DetailViewController.swift
//  recipes
//
//  Created by Deanne Chance on 3/6/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    let service = RecipeService()
    var idMeal = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(detailView)
        
        detailView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))
        
        service.getMealDetail(mealId: idMeal) { detail in
            
            DispatchQueue.main.async {
                self.detailView.mealName.text = detail.strMeal
                self.detailView.instructions.text = detail.strInstructions
            }
            
        }
        
        

    

    }
    


}
