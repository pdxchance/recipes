//
//  MainTableViewCell.swift
//  recipes
//
//  Created by Deanne Chance on 3/5/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    let image : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(image)
        addSubview(label)
        
        image.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: nil, size: .init(width: 100, height: 100))
        label.anchor(top: nil, bottom: nil, leading: image.trailingAnchor, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0))
        label.centerY(center: self.centerYAnchor)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
