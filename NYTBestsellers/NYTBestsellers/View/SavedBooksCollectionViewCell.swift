//
//  SavedBooksCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SavedBooksCollectionViewCell: UICollectionViewCell {
    public lazy var moreOptionsButton: UIButton = {
        let button = UIButton()
        button.setTitle("•••", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    public lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeHolder"))
        return iv
    }()
    
    public lazy var bookTitleAndAuthor: UILabel = {
        let label = UILabel()
        label.text = "\"Title\" by Author Names"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Book Description"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.addSubview(moreOptionsButton)
        self.addSubview(bookImage)
        self.addSubview(bookTitleAndAuthor)
        self.addSubview(bookDescriptionLabel)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        [bookImage, bookTitleAndAuthor, bookDescriptionLabel, moreOptionsButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
         bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
         bookImage.heightAnchor.constraint(equalToConstant: 300),
         bookImage.widthAnchor.constraint(equalToConstant: 200),
         
         bookTitleAndAuthor.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 11),
         bookTitleAndAuthor.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
         
         bookDescriptionLabel.topAnchor.constraint(equalTo: bookTitleAndAuthor.bottomAnchor, constant: 11),
         bookDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11),
         bookDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11),
         bookDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
         
         moreOptionsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),
         moreOptionsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)
            ].forEach{ $0.isActive = true }
    }
}
