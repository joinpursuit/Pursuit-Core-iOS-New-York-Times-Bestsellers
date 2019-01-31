//
//  NYTDetailBestSellingView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailBestSellingView: UIView {
    
    lazy var bookImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "bookImagePlaceHolder")
        return iv
    }()
    
    lazy var bookTitleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Book Title"
        label.backgroundColor = UIColor(hexString: "86c1d4")
        return label
    }()
    
    lazy var bookDescriptionTextView: UITextView = {
        var tv = UITextView()
        tv.isEditable = false
        tv.text = "I am a Happy Person 😺. I am a Happy Person 😺. I am a Happy Person 😺. I am a Happy Person 😺."
        tv.backgroundColor = UIColor(hexString: "d9f9f4")
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(hexString: "5a92af")
        setupView()
    }
}

extension NYTDetailBestSellingView {
    private func setupView() {
        setupBookImageView()
        setupBookTitleLabel()
        setupBookDescriptionTextField()
    }
    
    private func setupBookImageView() {
        addSubview(bookImageView)
        // constraints
    }
    
    private func setupBookTitleLabel() {
        addSubview(bookTitleLabel)
        // constraints
    }
    
    private func setupBookDescriptionTextField() {
        addSubview(bookDescriptionTextView)
        // constraints
    }
}
