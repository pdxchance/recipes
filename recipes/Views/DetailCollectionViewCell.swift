//
//  DetailCollectionViewCell.swift
//  recipes
//
//  Created by Deanne Chance on 3/7/23.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    let vStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let hStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    let mealName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.text = "SomeThing"
        label.textAlignment = .center
        label.numberOfLines = 0
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
        
        addSubview(hStackView)
        hStackView.addArrangedSubview(mealName)
        
        addSubview(vStackView)
        vStackView.addArrangedSubview(mealImage)
        vStackView.addArrangedSubview(instructions)
        
        hStackView.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 15, right: 0))

        vStackView.anchor(top: hStackView.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor , trailing: self.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        
        mealName.centerX(center: self.centerXAnchor)
        
        mealImage.anchor(top: vStackView.topAnchor, bottom: nil, leading: vStackView.leadingAnchor, trailing: vStackView.trailingAnchor, size: .init(width: 300, height: 200))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
