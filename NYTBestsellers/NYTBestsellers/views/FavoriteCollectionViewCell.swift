//
//  FavoriteCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class FavoriteCollectionViewCell: UICollectionViewCell {
    lazy var favoriteCollectionCellImage: UIImageView = {
        let background = UIImageView()
      let bg = UIImage(named: "BookPlaceHolder")
        background.image = bg
        return background
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .blue
        layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func cellImageConstrains() {
        addSubview(favoriteCollectionCellImage)
        favoriteCollectionCellImage.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
