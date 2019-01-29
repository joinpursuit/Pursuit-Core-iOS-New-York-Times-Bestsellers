//
//  BestsellersCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersCollectionViewCell: UICollectionViewCell {
    lazy var BestsellerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var NumberOfWeeksLabel: UILabel = {
        let weeksLabel = UILabel()
        weeksLabel.text = "randomText"
        weeksLabel.textAlignment = .center
        weeksLabel.textColor = .black
        return weeksLabel
    }()
    
    lazy var TextViewDescription: UITextView = {
        let textDescription = UITextView()
        textDescription.text = ""
        textDescription.textColor = .black
        return textDescription
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
     backgroundColor = .white
        addSubview(NumberOfWeeksLabel)
        addSubview(TextViewDescription)
        setImageConstraints()
        setLabelConstraint()
        setTextViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImageConstraints() {
         addSubview(BestsellerImageView)
        BestsellerImageView.translatesAutoresizingMaskIntoConstraints = false
        BestsellerImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        BestsellerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        BestsellerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
        BestsellerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
    }
    
    func setLabelConstraint() {
        addSubview(NumberOfWeeksLabel)
        NumberOfWeeksLabel.translatesAutoresizingMaskIntoConstraints = false
        NumberOfWeeksLabel.topAnchor.constraint(equalTo: BestsellerImageView.bottomAnchor, constant: 11).isActive = true
        NumberOfWeeksLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NumberOfWeeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    func setTextViewConstraint() {
        addSubview(TextViewDescription)
        TextViewDescription.translatesAutoresizingMaskIntoConstraints = false
        TextViewDescription.topAnchor.constraint(equalTo: NumberOfWeeksLabel.bottomAnchor, constant: 2).isActive = true
        TextViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        TextViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        TextViewDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true 
        
    }
}
  

    



