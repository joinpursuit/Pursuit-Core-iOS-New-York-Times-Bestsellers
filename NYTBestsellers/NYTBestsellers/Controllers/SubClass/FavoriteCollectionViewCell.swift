//
//  FavoriteCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()
    lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        return label
    }()
    lazy var bookText: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .black
        return textView
    }()
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("•••", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setupCells()
    }
}

extension FavoriteCollectionViewCell {
    private func setupCells() {
        setupImageView()
        setupLabel()
        setupTextView()
        setupButton()
    }
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    }
    private func setupLabel() {
        addSubview(bookLabel)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 5).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    private func setupTextView() {
        addSubview(bookText)
        bookText.translatesAutoresizingMaskIntoConstraints = false
        bookText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookText.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 10).isActive = true
        bookText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        bookText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        bookText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    private func setupButton(){
        addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
