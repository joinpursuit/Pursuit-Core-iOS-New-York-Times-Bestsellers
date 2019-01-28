//
//  CollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    lazy var bestSellerCollectionCellImage: UIImageView = {
        let imageview = UIImageView()
        let myImage = UIImage.init(named: "BookPlaceHolder")
        imageview.image = myImage
        
        return imageview
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
        return myTextView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        layer.cornerRadius = 5
        cellImageConstrains()
      labelConstrains()
        textViewConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellImageConstrains() {
        addSubview(bestSellerCollectionCellImage)
        bestSellerCollectionCellImage.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollectionCellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        bestSellerCollectionCellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true
        bestSellerCollectionCellImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        bestSellerCollectionCellImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
    }
    
    private func labelConstrains() {
        addSubview(bestSellerCollectionLabel)
        bestSellerCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        bestSellerCollectionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        bestSellerCollectionLabel.topAnchor.constraint(equalTo: bestSellerCollectionCellImage.bottomAnchor, constant: 10).isActive = true
    }
    
    private func textViewConstrains() {
        addSubview(bestSellerTextView)
        bestSellerTextView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerTextView.leadingAnchor.constraint(equalTo: bestSellerCollectionLabel.leadingAnchor).isActive = true
        bestSellerTextView.trailingAnchor.constraint(equalTo: bestSellerCollectionLabel.trailingAnchor).isActive = true
        bestSellerTextView.topAnchor.constraint(equalTo: bestSellerCollectionLabel.bottomAnchor, constant: 5).isActive = true
        bestSellerTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
}
