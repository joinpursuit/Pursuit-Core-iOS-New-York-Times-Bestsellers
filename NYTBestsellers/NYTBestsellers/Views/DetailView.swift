//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        return image
    }()
    lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textAlignment = .center
        
        return label
    }()
    lazy var bookText: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14.0)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        self.backgroundColor = .white
        
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

extension DetailView {
    private func setupCells() {
        setupImageView()
        setupLabel()
        setupTextView()
    }
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    private func setupLabel() {
        addSubview(bookLabel)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        //bookLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    private func setupTextView() {
        addSubview(bookText)
        bookText.translatesAutoresizingMaskIntoConstraints = false
        bookText.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        bookText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        bookText.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 10).isActive = true
        bookText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        bookText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bookText.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
    }
}

