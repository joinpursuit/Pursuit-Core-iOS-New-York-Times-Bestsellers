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
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var myTextView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.textColor = .black
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 17)
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
        backgroundColor = .white
        setupViews()
    }
    
}


extension BestSellerDetailView {
    private func setupViews() {
        setContstaintsForPhotoOfBook()
        setConstraintsForBookTitle()
        setContstaintsForMyTextView()
    }
    private func setContstaintsForPhotoOfBook(){
        addSubview(photoOfBook)
        photoOfBook.translatesAutoresizingMaskIntoConstraints = false
        photoOfBook.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        photoOfBook.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoOfBook.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoOfBook.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    private func setConstraintsForBookTitle() {
        addSubview(bookTitle)
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        bookTitle.topAnchor.constraint(equalTo: photoOfBook.bottomAnchor, constant: 8).isActive = true
       
        bookTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    private func setContstaintsForMyTextView() {
        addSubview(myTextView)
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        myTextView.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 11).isActive = true
        myTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        myTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }

}
