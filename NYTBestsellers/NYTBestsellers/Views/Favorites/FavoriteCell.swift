//
//  FavoriteCell.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    let myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        return button
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Joshua Viera"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    func addViews(){
        backgroundColor = .darkGray
        addSubview(myButton)
        addSubview(myLabel)
        setConstraints()
    }
    
    func setConstraints(){
        photoImageConstraints()
        nameLabelConstraints()
    }
    
    func photoImageConstraints(){
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        myButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        myButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
    }
    func nameLabelConstraints(){
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.leftAnchor.constraint(equalTo: myButton.rightAnchor, constant: 5).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: myButton.centerYAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
