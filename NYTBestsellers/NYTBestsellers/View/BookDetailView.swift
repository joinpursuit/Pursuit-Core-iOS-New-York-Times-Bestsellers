//
//  BookDetailView.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookDetailView: UIView {
    
//    public lazy var navigationController: UINavigationController = {
//       let nc = UINavigationController()
//        return nc
//    }()
    
    public lazy var navigationItem: UINavigationItem = {
        let ni = UINavigationItem()
        ni.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(actionHere))
        ni.title = "Book Detail"
        ni.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backButtonPressed))
        return ni
    }()
    
    public lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = .white
        navigationBar.items = [navigationItem]
        return navigationBar
    }()

    @objc func actionHere() {
        print("fav button pressed")
    }
    
    @objc func backButtonPressed() {
        print("back button pressed")
    }

    public lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeHolder"))
        return iv
    }()
    
    public lazy var bookDetailTextView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.font = tv.font?.withSize(14)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addSubview(bookImage)
        addSubview(bookDetailTextView)
        addSubview(navigationBar)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        [bookImage, bookDetailTextView, navigationBar].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        [bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
         bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
         bookImage.heightAnchor.constraint(equalToConstant: 300),
         bookImage.widthAnchor.constraint(equalToConstant: 250),].forEach{ $0.isActive = true }
        [bookDetailTextView.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 22),
         bookDetailTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
         bookDetailTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 22),
         bookDetailTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 22)].forEach{ $0.isActive = true }
        [navigationBar.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
         navigationBar.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
         navigationBar.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0)].forEach{ $0.isActive = true }
    }

}
