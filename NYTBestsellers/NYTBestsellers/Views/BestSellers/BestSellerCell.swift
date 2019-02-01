//
//  BestSellerCell.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
    
    public lazy var bookPhoto: UIImageView = {
        let image = UIImageView(image: UIImage(named: "imageHolder"))
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.italicSystemFont(ofSize: 13)
        textView.backgroundColor = .gray
        textView.textColor = .black
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addViews()
    }
    
    
    func addViews(){
        addSubview(descriptionTextView)
        addSubview(bookPhoto)
        addSubview(nameLabel)
        setConstraints()
    }
    
    func setConstraints(){
        backgroundColor = .gray
        photoImageConstraints()
        nameLabelConstraints()
        descriptionTextViewConstraints()
    }
    
    func photoImageConstraints(){
        bookPhoto.translatesAutoresizingMaskIntoConstraints = false
        bookPhoto.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bookPhoto.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bookPhoto.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookPhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func nameLabelConstraints(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.topAnchor.constraint(equalTo: bookPhoto.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    func descriptionTextViewConstraints(){
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
