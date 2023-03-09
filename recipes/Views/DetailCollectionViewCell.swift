//
//  DetailCollectionViewCell.swift
//  recipes
//
//  Created by Deanne Chance on 3/7/23.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    let mealName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let mealImage : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let instructions : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {

        super.init(frame:frame)
        
        
        addSubview(mealName)
        addSubview(mealImage)
        addSubview(instructions)
        
        mealName.centerX(center: self.centerXAnchor)
        
        mealImage.anchor(top: mealName.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 250))
        
        
        instructions.anchor(top: mealImage.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 15, left: 10, bottom: 0, right: 10))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
