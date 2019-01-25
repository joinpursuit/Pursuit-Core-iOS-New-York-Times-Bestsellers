//
//  CollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    public lazy var imageView:UIImageView = {
        
        let photo = UIImageView()
        photo.backgroundColor = .red
        
        return photo
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        self.addSubview(imageView)
        setConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setConstrains(){
        
imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
       imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        
        
        
        
    }

    
}
