//
//  FavoritesCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    public lazy var bookImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "icons8-book-50"))
        return image
    }()
    
    public lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "randomText"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public lazy var descriptionField: UITextView = {
        let description = UITextView()
        description.text = ""
        description.textColor = .black
        return description
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        addSubview(authorLabel)
        addSubview(descriptionField)
        setupBookImage()
        setupWeeksLabel()
        setupDescription()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FavoritesCollectionViewCell {
    private func setupView() {
        
    }
    
    private func setupBookImage() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        bookImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
        bookImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
    }
    
    private func setupWeeksLabel() {
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 11).isActive = true
        authorLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func setupDescription() {
        addSubview(descriptionField)
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 2).isActive = true
        descriptionField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        descriptionField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        descriptionField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
