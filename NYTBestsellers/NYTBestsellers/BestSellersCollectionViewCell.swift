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
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
       setupBookImage()
       setupBookNameLabel()
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
}
