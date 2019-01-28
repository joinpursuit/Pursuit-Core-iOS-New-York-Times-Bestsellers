//
//  BookDetailView.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookDetailView: UIView {

    public lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeHolder"))
        return iv
    }()
    
    public lazy var bookDetailTextView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.font = tv.font?.withSize(14)
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addSubview(bookImage)
        addSubview(bookDetailTextView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        [bookImage, bookDetailTextView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        [bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
         bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
         bookImage.heightAnchor.constraint(equalToConstant: 300),
         bookImage.widthAnchor.constraint(equalToConstant: 250),].forEach{ $0.isActive = true }
        [bookDetailTextView.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 22),
         bookDetailTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
         bookDetailTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 22),
         bookDetailTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 22)].forEach{ $0.isActive = true }
//        [navigationBar.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
//         navigationBar.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
//         navigationBar.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0)].forEach{ $0.isActive = true }
    }

}
