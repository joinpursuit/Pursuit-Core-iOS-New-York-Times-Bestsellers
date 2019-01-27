//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var detailBookImage: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    lazy var detailBookTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = .clear
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    func setupViews() {
        setImage()
        setTextView()
    }
    
    func setImage(){
        addSubview(detailBookImage)
        detailBookImage.translatesAutoresizingMaskIntoConstraints = false
        detailBookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        detailBookImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        detailBookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        detailBookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setTextView() {
        addSubview(detailBookTextView)
        detailBookTextView.translatesAutoresizingMaskIntoConstraints = false
        detailBookTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        detailBookTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        detailBookTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        detailBookTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
}

