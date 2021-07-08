//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()
    lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    lazy var bookText: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .yellow
        textView.isEditable = false
        return textView
    }()
    lazy var amazonButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "amazon"), for: .normal)
        return button
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "favorite"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    private func commonInit(){
        backgroundColor = .brown
        setUpConstraints()
    }
}

extension DetailView {
    private func setUpConstraints() {
        setupImageView()
        setupLabel()
        setupTextView()
        setupButton()
    }
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 235).isActive = true
        bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    private func setupLabel() {
        addSubview(bookLabel)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 5).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    private func setupTextView() {
        addSubview(bookText)
        bookText.translatesAutoresizingMaskIntoConstraints = false
        bookText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookText.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 10).isActive = true
        bookText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        bookText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        bookText.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
    }
    private func setupButton(){
        addSubview(amazonButton)
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        amazonButton.trailingAnchor.constraint(equalTo:safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        amazonButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        amazonButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
