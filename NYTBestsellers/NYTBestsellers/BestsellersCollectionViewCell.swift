//
//  BestsellersCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersCollectionViewCell: UICollectionViewCell {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    lazy var BestsellerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var NumberOfWeeksLabel: UILabel = {
        let weeksLabel = UILabel()
        weeksLabel.text = "randomText"
        return weeksLabel
    }()
    
    lazy var TextViewDescription: UITextView = {
        let textDescription = UITextView()
        return textDescription
    }()
}
    



