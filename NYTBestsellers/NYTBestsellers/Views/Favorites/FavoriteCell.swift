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
        button.setTitle("...", for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .white
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    public lazy var favoriteBookPhoto: UIImageView = {
        let image = UIImageView(image: UIImage(named: "imageHolder"))
        return image
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Description"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.isEditable = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    func addViews(){
        buttonConstraints()
        nameLabelConstraints()
        favoriteBookPhotoConstraints()
        textFieldConstraints()
    }
    
 
    
    func favoriteBookPhotoConstraints(){
        addSubview(favoriteBookPhoto)
        favoriteBookPhoto.translatesAutoresizingMaskIntoConstraints = false
        favoriteBookPhoto.topAnchor.constraint(equalTo: topAnchor).isActive = true
        favoriteBookPhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        favoriteBookPhoto.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25).isActive = true
        favoriteBookPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
    }
    
    func buttonConstraints(){
        addSubview(optionsButton)
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
       
        optionsButton.topAnchor.constraint(equalTo: topAnchor, constant: 38).isActive = true
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
