//
//  DetailViewController.swift
//  recipes
//
//  Created by Deanne Chance on 3/6/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let cellReuseId = "cellReuseId"
    
    var collectionView: UICollectionView!
    
    var collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    var vm = RecipeDetailViewModel(detail: RecipeDetail())
    
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
                    self.vm = detail
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           collectionViewHeightConstraint.constant = collectionViewLayout.collectionViewContentSize.height
       }
    
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        view.addSubview(collectionView)
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 50)
        collectionViewHeightConstraint.isActive = true
        
        self.collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseId)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        

        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! DetailCollectionViewCell
        
        cell.mealName.text = vm.mealName
        cell.mealImage.kf.setImage(with: URL(string: vm.mealImageUrl))
        cell.instructions.text = vm.instructions
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

}
