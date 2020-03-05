//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    lazy var bookDetailImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "bookPlaceHolder")
        return image
    }()
    
    lazy var authorName: UILabel = {
        let label = UILabel()
        label.text = "Author's name"
        label.textAlignment = .center
        return label
    }()
    
    lazy var bookDescription: UITextView = {
        let textView = UITextView()
        textView.text = "Long book description..."
        textView.textAlignment = .justified
        textView.isEditable = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(bookDetailImageView)
        addSubview(authorName)
        addSubview(bookDescription)
        setpBookDetailImageView()
        setupAuthorName()
        setupBookDescription()
        
    }
    
    private func setpBookDetailImageView() {
        bookDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookDetailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),
            bookDetailImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            bookDetailImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            bookDetailImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)])
    }
    
    private func setupAuthorName() {
        authorName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorName.topAnchor.constraint(equalTo: bookDetailImageView.bottomAnchor),
            authorName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            authorName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)])
    }
    
    private func setupBookDescription() {
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookDescription.topAnchor.constraint(equalTo: authorName.bottomAnchor),
            bookDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bookDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bookDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
