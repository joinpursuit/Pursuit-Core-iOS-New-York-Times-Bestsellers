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
        setupLabelView()
        setupTextView()
    }
   private func setupImageView(){
    addSubview(favoriteImageObj)
    favoriteImageObj.translatesAutoresizingMaskIntoConstraints = false
    favoriteImageObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    favoriteImageObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
    favoriteImageObj.heightAnchor.constraint(equalToConstant: 100).isActive = true
    favoriteImageObj.widthAnchor.constraint(equalToConstant: 100).isActive = true
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
        favoriteDetailDescriptionObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 11).isActive = true
    }
}
