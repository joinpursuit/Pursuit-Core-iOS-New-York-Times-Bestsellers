//
//  CollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    public lazy var imageView:UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .red
        return photo
    }()
    
    public lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "Number of weeks spent at the top"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var TextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.text = "The text .........."
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .left
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(TextView)
        setConstrains()
        setLabelConstrains()
        setTextViewConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setConstrains(){
        
imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        
    }
    
    func setLabelConstrains(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    }

    func setTextViewConstrains(){
        TextView.translatesAutoresizingMaskIntoConstraints =  false
        TextView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        TextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        TextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        TextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
    }
    
    
}
