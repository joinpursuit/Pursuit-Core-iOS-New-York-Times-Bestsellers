//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

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
    override init(frame: CGRect) {
        super.init(frame: frame)
       commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    private func commonInit(){
        self.backgroundColor = .white
        setUp()
    }
    private func setUp(){
        imageConstraints()
        labelConstraint()
        textViewConstraint()
    }
    private func imageConstraints(){
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        image.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        image.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        image.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    private func labelConstraint(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
        label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 10).isActive = true
        
    }
    
    private func textViewConstraint(){
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        textView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }

}
