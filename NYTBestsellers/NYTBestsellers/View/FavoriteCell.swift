//
//  FavoriteCell.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {

    lazy var favoriteImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var actionButton: UIButton = {
        var button = UIButton()
        button.setTitle("...", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 50)
        button.setTitleColor(.black, for: .normal)
        //add action
        return button
    }()
    lazy var favoriteDetailsTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = .white
        return textView
    }()
    lazy var favoriteLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 20)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupImage()
        setupButton()
    }
    func setupImage(){
        addSubview(favoriteImage)
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        favoriteImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        favoriteImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        favoriteImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        favoriteImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupButton(){
        addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
}
