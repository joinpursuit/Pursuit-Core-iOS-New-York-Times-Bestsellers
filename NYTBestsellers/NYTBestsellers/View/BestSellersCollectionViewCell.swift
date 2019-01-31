//
//  BestSellersCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersCollectionViewCell: UICollectionViewCell {
    lazy var bookImage: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    lazy var bookNameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.text = "Hey"
        label.textAlignment = .center
        return label
    }()
    lazy var bookDescription: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        textView.text = "Hello Hello"
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.font = UIFont(name: "Futura", size: 15)
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.layer.borderWidth = 4
        self.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        self.layer.cornerRadius = 10
       setupBookImage()
       setupBookNameLabel()
       setupBookDescription()
    }
    
    private func setupBookImage(){
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupBookNameLabel() {
        addSubview(bookNameLabel)
        bookNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bookNameLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10).isActive = true
        bookNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    private func setupBookDescription() {
        addSubview(bookDescription)
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDescription.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bookDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bookDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookDescription.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 10).isActive = true
    }
}
