//
//  BestSellerCell.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
    let bestSellerView = BestSellerView()
    lazy var image: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 15.0)
        return label
    }()
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(image)
        addSubview(label)
        addSubview(textView)
        imageConstraints()
        labelConstraint()
        textViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        

    }
    private func imageConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        image.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        image.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        image.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    private func labelConstraint(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
        label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 10).isActive = true
        
    }
    
    private func textViewConstraint(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        textView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true

    }
    
}
