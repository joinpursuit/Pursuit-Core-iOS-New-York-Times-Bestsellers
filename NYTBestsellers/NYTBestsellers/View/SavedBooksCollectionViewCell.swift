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
        return button
    }()
    
    public lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeHolder"))
        return iv
    }()
    
    public lazy var bookTitleAndAuthor: UILabel = {
        let label = UILabel()
        label.text = "\"Title\" by Author Names"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Book Description"
        label.numberOfLines = 0
        label.font = label.font.withSize(14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.addSubview(moreOptionsButton)
        self.addSubview(bookImage)
        self.addSubview(bookTitleAndAuthor)
        self.addSubview(bookDescriptionLabel)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        [bookImage, bookTitleAndAuthor, bookDescriptionLabel, moreOptionsButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
         bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
         bookImage.heightAnchor.constraint(equalToConstant: 200),
         bookImage.widthAnchor.constraint(equalToConstant: 250),
         
         bookTitleAndAuthor.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 11),
         bookTitleAndAuthor.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
         bookTitleAndAuthor.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85),
         
         bookDescriptionLabel.topAnchor.constraint(equalTo: bookTitleAndAuthor.bottomAnchor, constant: 11),
         bookDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
         bookDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 5),
         
         moreOptionsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
         moreOptionsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 5),
         moreOptionsButton.leadingAnchor.constraint(equalTo: bookTitleAndAuthor.trailingAnchor, constant: 5)
            ].forEach{ $0.isActive = true }
    }
}
