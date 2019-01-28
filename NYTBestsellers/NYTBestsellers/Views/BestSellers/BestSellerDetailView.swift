//
//  BestSellerDetailView.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailView: UIView {

    
    public lazy var photoOfBook: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "imageHolder"))
        return iv
    }()
    
    public lazy var bookTitle: UILabel = {
        let label = UILabel()
        label.text = "Title of Book"
        label.textColor = .white
        label.backgroundColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var myTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TEXT VIEW"
        textView.backgroundColor = .black
        textView.textColor = .white
        return textView
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
    
    private func commonInit() {
        backgroundColor = .gray
        setupViews()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    
    
}


extension BestSellerDetailView {
    private func setupViews() {
        setContstaintsForPhotoOfBook()
        setConstraintsForBookTitle()
        setContstaintsForMyTextField()
    }
    private func setContstaintsForPhotoOfBook(){
        addSubview(photoOfBook)
        photoOfBook.translatesAutoresizingMaskIntoConstraints = false
        photoOfBook.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        photoOfBook.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        photoOfBook.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 11).isActive = true
    }
    private func setConstraintsForBookTitle() {
        addSubview(bookTitle)
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        bookTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bookTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        bookTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
    }
    
    private func setContstaintsForMyTextField() {
        addSubview(myTextView)
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        myTextView.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 11).isActive = true
        myTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        myTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
        myTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
