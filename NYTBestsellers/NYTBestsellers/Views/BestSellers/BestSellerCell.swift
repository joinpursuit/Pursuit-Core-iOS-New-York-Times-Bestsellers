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
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Joshua Viera"
        return label
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
        backgroundColor = .white
        addViews()
    }
    
    
    func addViews(){
        addSubview(descriptionTextView)
        addSubview(bookPhoto)
        addSubview(nameLabel)
        setConstraints()
    }
    
    func setConstraints(){
        photoImageConstraints()
        nameLabelConstraints()
        descriptionTextViewConstraints()
    }
    
    func photoImageConstraints(){
        bookPhoto.translatesAutoresizingMaskIntoConstraints = false
        bookPhoto.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bookPhoto.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bookPhoto.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookPhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
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
