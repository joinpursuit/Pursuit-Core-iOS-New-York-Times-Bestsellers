//
//  BookCell.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    lazy var bookImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        //<a href="https://www.freepik.com/free-photos-vectors/background">Background vector created by rawpixel.com - www.freepik.com</a>
        image.image = UIImage(named: "bookImagePlaceHolder")
        return image
    }()
 
    let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.text = "Book Title"
        
        return label
    }()
    
    let bookDescriptionTextview: UITextView = {
        let textview = UITextView()
        textview.isEditable = false
        textview.text = "Gibberish..........Gibberish..........Gibberish..........Gibberish..........Gibberish.........."
        textview.backgroundColor = UIColor(hexString: "ffcfdf", alpha: 0.9)
        return textview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commmonInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commmonInt()
    }
    
    private func commmonInt() {
        self.backgroundColor = UIColor(hexString: "ffcfdf")
        setupCell()
    }
    
    public func configureCell(nYTBook: NYTBook) {
        let bookDetails = nYTBook.bookDetails[0]
        bookTitleLabel.text = bookDetails.title
        bookDescriptionTextview.text = bookDetails.description
    }
    
}

extension BookCell {
    private func setupCell() {
        setupBookImage()
        setupBookTitleLabel()
        setupBookDescription()
    }
    
    private func setupBookImage() {
        addSubview(bookImageView)
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bookImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bookImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.55).isActive = true
        
    }
    
    private func setupBookTitleLabel() {
        addSubview(bookTitleLabel)
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTitleLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 10).isActive = true
        bookTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        bookTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    private func setupBookDescription() {
        addSubview(bookDescriptionTextview)
        bookDescriptionTextview.translatesAutoresizingMaskIntoConstraints = false
        bookDescriptionTextview.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 0).isActive = true
        bookDescriptionTextview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bookDescriptionTextview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bookDescriptionTextview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
    }
}
