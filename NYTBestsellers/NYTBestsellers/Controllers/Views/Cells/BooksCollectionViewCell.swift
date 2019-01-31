//
//  BooksCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .magenta
        setUpImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var BestsellerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "placeholder-image-2")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var WeeksLabel: UILabel = {
        let weeksLabel = UILabel()
        weeksLabel.text = "randomText"
        weeksLabel.textColor = .white
        weeksLabel.textAlignment = .center
        weeksLabel.backgroundColor = .magenta
        return weeksLabel
    }()
    
    lazy var TextViewDescription: UITextView = {
        let textDescription = UITextView()
        textDescription.textColor = .black
        textDescription.backgroundColor = .magenta
        textDescription.text = "well hello daylightt"
        return textDescription
    }()
    
    func setUpImageView() {
        addSubview(BestsellerImageView)
        addSubview(WeeksLabel)
        addSubview(TextViewDescription)
        
        BestsellerImageView.translatesAutoresizingMaskIntoConstraints = false
        WeeksLabel.translatesAutoresizingMaskIntoConstraints = false
        TextViewDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            BestsellerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            BestsellerImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7), BestsellerImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),BestsellerImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            ] )
        
        NSLayoutConstraint.activate([
            WeeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),  WeeksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5), WeeksLabel.topAnchor.constraint(equalTo: BestsellerImageView.bottomAnchor, constant: 0)
            ])
        NSLayoutConstraint.activate([
            TextViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),  TextViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5), TextViewDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),TextViewDescription.topAnchor.constraint(equalTo: WeeksLabel.bottomAnchor) /*TextViewDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),*/
            ])
    }
    
}
