//
//  NYTDetailBestSellingView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailBestSellingView: UIView {
    
    lazy var bookImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "bookImagePlaceHolder")
        return iv
    }()
    
    lazy var bookTitleAndAuthorLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Book Title"
        label.backgroundColor = UIColor(hexString: "86c1d4")
        return label
    }()
    
    lazy var bookDescriptionTextView: UITextView = {
        var tv = UITextView()
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 15)
        tv.text = "I am a Happy Person 😺. I am a Happy Person 😺. I am a Happy Person 😺. I am a Happy Person 😺."
        tv.backgroundColor = UIColor(hexString: "d9f9f4")
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(hexString: "5a92af")
        setupView()
    }
}

extension NYTDetailBestSellingView {
    private func setupView() {
        setupBookImageView()
        setupBookTitleLabel()
        setupBookDescriptionTextField()
    }
    
    private func setupBookImageView() {
        addSubview(bookImageView)
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bookImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        bookImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        NSLayoutConstraint(item: bookImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.85, constant: 0).isActive = true
    }
    
    private func setupBookTitleLabel() {
        addSubview(bookTitleAndAuthorLabel)
        bookTitleAndAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bookTitleAndAuthorLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 15).isActive = true
        bookTitleAndAuthorLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: bookTitleAndAuthorLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.85, constant: 0).isActive = true
    }
    
    private func setupBookDescriptionTextField() {
        addSubview(bookDescriptionTextView)
        bookDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        bookDescriptionTextView.topAnchor.constraint(equalTo: bookTitleAndAuthorLabel.bottomAnchor, constant: 15).isActive = true
        bookDescriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        bookDescriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: bookDescriptionTextView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.85, constant: 0).isActive = true
    }
}
