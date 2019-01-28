//
//  BestSellerCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    
    lazy var bookTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
    
}

extension BestSellerCollectionViewCell {
    private func setupView() {
        setupImageView()
        setupLabel()
        setupTextField()
    }
    
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupLabel() {
        addSubview(bookLabel)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 5).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupTextField() {
        addSubview(bookTextView)
        bookTextView.translatesAutoresizingMaskIntoConstraints = false
        bookTextView.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 5).isActive = true
        bookTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}
