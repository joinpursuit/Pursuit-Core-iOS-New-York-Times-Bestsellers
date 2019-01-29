//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    public lazy var imageView: UIImageView = {
        let bookImageView = UIImageView()
        bookImageView.backgroundColor = .red
        
        return bookImageView
     
    }()
    
    public lazy var label: UILabel = {
        let authorName = UILabel()
        authorName.textColor = .black
        authorName.font = UIFont.boldSystemFont(ofSize: 30)
        authorName.textAlignment = .center
        authorName.backgroundColor = .yellow
        return authorName
    }()
    
    public lazy var textView: UITextView = {
        let bookDescription = UITextView()
        bookDescription.textColor = .black
        bookDescription.textAlignment = .left
        bookDescription.font = UIFont.italicSystemFont(ofSize: 14)
        bookDescription.backgroundColor = .blue
        return bookDescription
    }()
    
    
    public var item: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.title = "Favorite"
        return item
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(imageView)
        addSubview(label)
        addSubview(textView)
        
        setImageviewConstrains()
        setLabelConstrains()
        setTextViewConstrains()
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setImageviewConstrains(){
    imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
     imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
    }
    
    func setLabelConstrains(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
        
    }
    
    func setTextViewConstrains(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }

}



