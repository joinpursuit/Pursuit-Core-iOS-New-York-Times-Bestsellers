//
//  FavoiteBookCell.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoiteBookCell: UICollectionViewCell {
    lazy var favoriteImageObj: UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "placeHolder"))
        return image
    }()
    lazy var deletebuttonObj: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        return button
    }()
    lazy var favoriteBookTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Seller list label"
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()
    lazy var favoriteDetailDescriptionObj: UITextView = {
        let textView = UITextView()
        textView.text = "This area will give a little description"
        textView.textColor = .white
        textView.backgroundColor = .gray
        textView.isSelectable = false
        textView.isEditable = false 
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
        backgroundColor = .red
        layer.cornerRadius = 10
        setupViews()
    }
    private func setupViews(){
        setupImageView()
        setupButtonView()
        setupLabelView()
        setupTextView()
    }
   private func setupImageView(){
    addSubview(favoriteImageObj)
    favoriteImageObj.translatesAutoresizingMaskIntoConstraints = false
    favoriteImageObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    favoriteImageObj.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
    favoriteImageObj.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
    favoriteImageObj.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true

    }
    private func setupButtonView(){
        addSubview(deletebuttonObj)
        deletebuttonObj.translatesAutoresizingMaskIntoConstraints = false
        deletebuttonObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        deletebuttonObj.leadingAnchor.constraint(equalTo: favoriteImageObj.trailingAnchor, constant: 11).isActive = true
        deletebuttonObj.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        deletebuttonObj.heightAnchor.constraint(equalToConstant: 60).isActive = true
        deletebuttonObj.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    private func setupLabelView(){
        addSubview(favoriteBookTitleLabel)
        favoriteBookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteBookTitleLabel.topAnchor.constraint(equalTo: favoriteImageObj.bottomAnchor, constant: 11).isActive = true
        favoriteBookTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteBookTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    private func setupTextView() {
        addSubview(favoriteDetailDescriptionObj)
    favoriteDetailDescriptionObj.translatesAutoresizingMaskIntoConstraints = false
        favoriteDetailDescriptionObj.topAnchor.constraint(equalTo: favoriteBookTitleLabel.bottomAnchor, constant: 0).isActive = true
        favoriteDetailDescriptionObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteDetailDescriptionObj.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        favoriteDetailDescriptionObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}
