//
//  FavoriteCell.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    let optionsButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle("...", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.backgroundColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var favoriteBookPhoto: UIImageView = {
        let image = UIImageView(image: UIImage(named: "imageHolder"))
        image.backgroundColor = .gray
        return image
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Description"
        textView.font = UIFont.italicSystemFont(ofSize: 17)
        textView.backgroundColor = .gray
        textView.textColor = .black
        textView.isEditable = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    func addViews(){
        backgroundColor = .gray
        buttonConstraints()
        nameLabelConstraints()
        favoriteBookPhotoConstraints()
        textFieldConstraints()
    }
    
 
    
    func favoriteBookPhotoConstraints(){
        addSubview(favoriteBookPhoto)
        favoriteBookPhoto.translatesAutoresizingMaskIntoConstraints = false
        favoriteBookPhoto.topAnchor.constraint(equalTo: topAnchor).isActive = true
        favoriteBookPhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        favoriteBookPhoto.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40).isActive = true
        favoriteBookPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
    }
    
    func buttonConstraints(){
        addSubview(optionsButton)
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        optionsButton.topAnchor.constraint(equalTo: favoriteBookPhoto.bottomAnchor)
        
        optionsButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }
    
    func nameLabelConstraints(){
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func textFieldConstraints(){
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
