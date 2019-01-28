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
    
    
    lazy var bestSellerCollectionLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
        mylabel.backgroundColor = .black
        mylabel.text = "Book test"
        mylabel.textColor = .white
        return mylabel
    }()
    
    lazy var bestSellerTextView: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .white
        myTextView.backgroundColor = .gray
        myTextView.textAlignment = .center
        myTextView.text = "Book description test"
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
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
