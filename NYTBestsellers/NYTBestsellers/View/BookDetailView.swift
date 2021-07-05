//
//  BookDetailView.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookDetailView: UIView {
    
    public lazy var amazonButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "amazon"), for: .normal)
        return button
    }()

    public lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeHolder"))
        return iv
    }()
    
    public lazy var bookDetail: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isSelectable = false
        tv.font = tv.font?.withSize(20)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addSubview(bookImage)
        addSubview(bookDetail)
        addSubview(amazonButton)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        [bookImage, bookDetail, amazonButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
         bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
         bookImage.heightAnchor.constraint(equalToConstant: 300),
         bookImage.widthAnchor.constraint(equalToConstant: 250),
         
         bookDetail.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 22),
         bookDetail.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
         bookDetail.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),
         bookDetail.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -22),
            
         amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
         amazonButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
         amazonButton.heightAnchor.constraint(equalToConstant: 48),
         amazonButton.widthAnchor.constraint(equalToConstant: 48)
         ].forEach{ $0.isActive = true }
    }

}
