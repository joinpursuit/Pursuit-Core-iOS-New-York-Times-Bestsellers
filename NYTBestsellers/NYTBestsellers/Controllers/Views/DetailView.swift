//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "placeholder-image-2")
        return image
    }()
    
    lazy var bookAuthor: UILabel = {
        let label = UILabel()
        label.text = "Michelle Obama"
        return label
    }()
    
    lazy var bookDescription: UITextView = {
      let textView = UITextView()
        textView.text = "long description here"
        return textView
    }()
    
}
