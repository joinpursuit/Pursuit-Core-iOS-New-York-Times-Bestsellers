//
//  BestSellerCell.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var textView: UITextView = {
        let textView = UITextView()
        return textView
    }()
}

