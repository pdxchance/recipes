//
//  DetailViewController.swift
//  recipes
//
//  Created by Deanne Chance on 3/6/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellReuseId = "cellReuseId"
    
    var collectionView: UICollectionView!
    
    var data = RecipeDetail()
    
    let service = RecipeService()
    var idMeal = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupCollectionView()
        
        service.getMealDetail(mealId: idMeal) { [weak self] detail in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let detail = detail {
                    self.data = detail
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    fileprivate func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.view = collectionView
        
        self.collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseId)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! DetailCollectionViewCell
        
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
