//
//  DetailViewController.swift
//  recipes
//
//  Created by Deanne Chance on 3/6/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    var data = RecipeDetail(idMeal: "", strMeal: "", strInstructions: "", strMealThumb: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "")
    
    let service = RecipeService()
    var idMeal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.view = collectionView
        
        self.collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "cellReuseId")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        service.getMealDetail(mealId: idMeal) { detail in
            
            DispatchQueue.main.async {
                if let detail = detail {
                    self.data = detail
                }
                self.collectionView.reloadData()
            }
            
        }
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReuseId", for: indexPath) as! DetailCollectionViewCell
        
        
        let vm = RecipeDetailViewModel(detail: data)
        cell.mealName.text = vm.mealName
        cell.mealImage.kf.setImage(with: URL(string: vm.mealImageUrl))
        cell.instructions.text = vm.instructions
        
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    
}
