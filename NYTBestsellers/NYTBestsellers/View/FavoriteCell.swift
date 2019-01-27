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
//        button.addTarget(self, action: #selector(actionBottonPressed), for: .touchUpInside)
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
        label.text = "Label"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 17)
        label.textAlignment = .center
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
    
//    @objc func actionBottonPressed(){
//        delegate?.buttonPress()
//    }
    func setupViews(){
        setupImage()
        setupButton()
        setupLabel()
        setupTextView()
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
        actionButton.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupLabel(){
        addSubview(favoriteLabel)
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.topAnchor.constraint(equalTo: favoriteImage.bottomAnchor, constant: 10).isActive = true
        favoriteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        favoriteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
    func setupTextView(){
        addSubview(favoriteDetailsTextView)
        favoriteDetailsTextView.translatesAutoresizingMaskIntoConstraints = false
        favoriteDetailsTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        favoriteDetailsTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        favoriteDetailsTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        favoriteDetailsTextView.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 10).isActive = true
    }
}
