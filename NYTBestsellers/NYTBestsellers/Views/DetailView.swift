//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var bookTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 20)
        return textView
    }()
    
    lazy var amazonButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "amazon"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
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
extension DetailView {
    private func setupView() {
        setupImageView()
        setupLabel()
        setupTextField()
        setupButton()
    }
    
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
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
        bookTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupButton() {
        addSubview(amazonButton)
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        amazonButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        amazonButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        amazonButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

