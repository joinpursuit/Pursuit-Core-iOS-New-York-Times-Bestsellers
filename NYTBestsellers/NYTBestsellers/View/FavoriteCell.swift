//
//  FavoriteCell.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    lazy var bookImageView: UIImageView = {
        var imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "bookImagePlaceHolder")
        return imageV
    }()
    
    lazy var favoritePopupMenuButton: UIButton = {
        var button = UIButton()
        button.setTitle("...", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(favoritePopupMenu), for: .touchUpInside)
        return button
    }()
    
    lazy var weekOnListLabel: UILabel = {
        var  label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "Number of weeks as best sellers"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bookDescriptionTextView: UITextView = {
        var tv = UITextView()
        tv.backgroundColor = UIColor(hexString: "f4f3f3")
        tv.isEditable = false
        tv.text = "Here's what this book is about. Enjoy!"
        return tv
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
        backgroundColor = UIColor(hexString: "b1bed5")
        setupCellItemsConstraints()
    }
    
    @objc private func favoritePopupMenu() {
        
    }
    
    private func configureCell(favoriteBook: FavoriteBook) {
        if let imageData = favoriteBook.imageData, let image = UIImage.init(data: imageData) {
            bookImageView.image = image
        }
        weekOnListLabel.text = "\(favoriteBook.bookDetails.weeksOnList) weeks on best seller list"
        bookDescriptionTextView.text = favoriteBook.bookDetails.bookDetails[0].description
    }
}

extension FavoriteCell {
    private func setupCellItemsConstraints() {
        setupBookImageView()
        setupFavoritePopupMenuButton()
        setupWeekOnListLabel()
        setupBookDescriptionTextView()
    }
    
    private func setupBookImageView() {
        addSubview(bookImageView)
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bookImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        bookImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6, constant: 0).isActive = true
    }
    
    private func setupFavoritePopupMenuButton() {
        addSubview(favoritePopupMenuButton)
        favoritePopupMenuButton.translatesAutoresizingMaskIntoConstraints = false
        
        favoritePopupMenuButton.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        favoritePopupMenuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupWeekOnListLabel() {
        addSubview(weekOnListLabel)
        weekOnListLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weekOnListLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 11).isActive = true
        weekOnListLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        weekOnListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    private func setupBookDescriptionTextView() {
        addSubview(bookDescriptionTextView)
        bookDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        bookDescriptionTextView.topAnchor.constraint(equalTo: weekOnListLabel.bottomAnchor, constant: 15).isActive = true
        bookDescriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        bookDescriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        bookDescriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
