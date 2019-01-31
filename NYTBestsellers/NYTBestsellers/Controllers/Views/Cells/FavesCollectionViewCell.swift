//
//  FavesCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavesCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .magenta
        setUpImageView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public lazy var FavesImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.image = UIImage.init(named: "icons8-book-50")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
   public lazy var WeeksLabel: UILabel = {
        let weeksLabel = UILabel()
        weeksLabel.text = ""
        weeksLabel.textColor = .white
        weeksLabel.textAlignment = .center
        weeksLabel.backgroundColor = .magenta
        return weeksLabel
    }()
    
    public lazy var TextViewDescription: UITextView = {
        let textDescription = UITextView()
        textDescription.textColor = .white
        textDescription.backgroundColor = .magenta
        textDescription.text = "well hello midnight"
        return textDescription
    }()
    func setUpImageView() {
        addSubview(FavesImageView)
        addSubview(WeeksLabel)
        addSubview(TextViewDescription)
        
        FavesImageView.translatesAutoresizingMaskIntoConstraints = false
        WeeksLabel.translatesAutoresizingMaskIntoConstraints = false
        TextViewDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            FavesImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            FavesImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0), FavesImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35), WeeksLabel.topAnchor.constraint(equalTo: FavesImageView.bottomAnchor, constant: 8), FavesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11)] )
        
        NSLayoutConstraint.activate([
            WeeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),  WeeksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),TextViewDescription.topAnchor.constraint(equalTo: WeeksLabel.bottomAnchor, constant: 0)
            ])
        NSLayoutConstraint.activate([
            TextViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),  TextViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5), TextViewDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0), TextViewDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            ])
        
        
    }
}
