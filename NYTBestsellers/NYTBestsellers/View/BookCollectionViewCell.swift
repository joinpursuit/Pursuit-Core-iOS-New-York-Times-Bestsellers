//
//  BookCell.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    public lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeHolder"))
        return iv
    }()
    
    public lazy var numberOfWeeksOnList: UILabel = {
        let label = UILabel()
        label.text = "Number of weeks on list"
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
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        self.addSubview(bookImage)
        self.addSubview(numberOfWeeksOnList)
        self.addSubview(bookDescriptionLabel)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func setConstraints() {
        [bookImage, numberOfWeeksOnList, bookDescriptionLabel].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        [bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
         bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
         bookImage.heightAnchor.constraint(equalToConstant: 150),
         bookImage.widthAnchor.constraint(equalToConstant: 125),
         
         numberOfWeeksOnList.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 11),
         numberOfWeeksOnList.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
         numberOfWeeksOnList.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 5),
         
         bookDescriptionLabel.topAnchor.constraint(equalTo: numberOfWeeksOnList.bottomAnchor, constant: 11),
         bookDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
         bookDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 5)
            ].forEach{ $0.isActive = true }
    }
    
    public func configureCell(book: NYTBook) {
        bookDescriptionLabel.text = book.book_details.first?.bookShortDescription
        numberOfWeeksOnList.text = "\(book.weeks_on_list.description) week on Best Seller"
    }
}
