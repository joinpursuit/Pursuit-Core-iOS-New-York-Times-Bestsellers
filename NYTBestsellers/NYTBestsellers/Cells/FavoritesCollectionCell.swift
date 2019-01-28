//
//  FavoritesCollectionCell.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCollectionCell: UICollectionViewCell {
    
    lazy var coverImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "bookPlaceHolder")
        return image
    }()
    
    lazy var weeksLabel: UILabel = {
        let label = UILabel()
        label.text = "...weeks..."
        label.textAlignment = .center
        return label
    }()
    
    lazy var favoritesDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = " description goes here...."
        return textView
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        
        setFavoritesConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setFavoritesConstraints() {
        addSubview(coverImageView)
        addSubview(weeksLabel)
        addSubview(favoritesDescriptionTextView)
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        weeksLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritesDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0.5),
            coverImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50),
            coverImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            weeksLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor),
            weeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            weeksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11)
            ])
        
        NSLayoutConstraint.activate([
            favoritesDescriptionTextView.topAnchor.constraint(equalTo: weeksLabel.bottomAnchor, constant: 5),
            favoritesDescriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            favoritesDescriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11),
            favoritesDescriptionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
            
            ])
    }
}
