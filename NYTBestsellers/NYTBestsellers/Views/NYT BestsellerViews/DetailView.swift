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
       
        
        return bookImageView
     
    }()
    
    public lazy var label: UILabel = {
        let authorName = UILabel()
        authorName.textColor = .white
        authorName.font = UIFont.boldSystemFont(ofSize: 30)
        authorName.textAlignment = .center
        authorName.text = "no author name"
        authorName.numberOfLines = 0
        return authorName
    }()
    
    public lazy var textView: UITextView = {
        let bookDescription = UITextView()
        bookDescription.textColor = .black
        bookDescription.textAlignment = .left
        bookDescription.font = UIFont.italicSystemFont(ofSize: 16)
   
        return bookDescription
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setImageviewConstrains()
        setLabelConstrains()
        setTextViewConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setImageviewConstrains(){
        addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
     imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
    }
    
    func setLabelConstrains(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func setTextViewConstrains(){
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}



