//
//  FavoritesCell.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    let favoritesView = FavoritesView()
    lazy var image: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        return textView
    }()
    lazy var button: UIButton = {
        let button = UIButton()
      button.setImage(UIImage(named: "icons8-more"), for: .normal)
        
        button.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        addSubview(image)
        addSubview(label)
        addSubview(textView)
        addSubview(button)
        imageConstraints()
        labelConstraint()
        textViewConstraint()
        buttonConstriants()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
        
    }
    private func imageConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        image.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        image.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        image.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    private func labelConstraint(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
        label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 10).isActive = true
        
    }
    
    private func textViewConstraint(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        textView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    private func buttonConstriants(){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 11).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
}


