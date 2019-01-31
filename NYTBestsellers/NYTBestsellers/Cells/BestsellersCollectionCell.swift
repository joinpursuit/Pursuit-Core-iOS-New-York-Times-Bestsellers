//
//  BestsellersCollectionCell.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersCollectionCell: UICollectionViewCell {
    
    
    lazy var bookImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "bookPlaceHolder")
        return image
    }()
    
    lazy var weeksLabel: UILabel = {
        let label = UILabel()
        label.text = "...weeks..."
        label.textAlignment = .center
        return label
    }()
    
    lazy var bestsellersDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = " description goes here...."
        textView.isEditable = false
        return textView
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        //addSubview(bookImageView)
        setContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContraints() {
        addSubview(bookImageView)
        addSubview(weeksLabel)
        addSubview(bestsellersDescriptionTextView)
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        weeksLabel.translatesAutoresizingMaskIntoConstraints = false
        bestsellersDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0.5),
            bookImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50),
            bookImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            weeksLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor),
            weeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            weeksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11)
            ])
        
        NSLayoutConstraint.activate([
            
            bestsellersDescriptionTextView.topAnchor.constraint(equalTo: weeksLabel.bottomAnchor, constant: 5),
            bestsellersDescriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            bestsellersDescriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11),
            bestsellersDescriptionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
            
            ])
    }
}
