//
//  DetailView.swift
//  recipes
//
//  Created by Deanne Chance on 3/6/23.
//

import UIKit

class DetailView: UIView {

    let mealName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
         addSubview(instructions)
         
         mealName.centerX(center: self.centerXAnchor)
         instructions.anchor(top: mealName.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor)
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
     }


}
