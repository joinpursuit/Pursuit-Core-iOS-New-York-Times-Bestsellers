//
//  BestSellerCell.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
    let imageName = "placeHolder"
    lazy var imageObj: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: imageName))
        return imageView
    }()
    lazy var titleLabelObj: UILabel = {
        let label = UILabel()
        label.text = "Best Seller list label"
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()
    lazy var bestSellerBookDescriptionTxtViewObj: UITextView = {
        let textview = UITextView()
        textview.text = "This area will give a little description"
        textview.textColor = .white
        textview.backgroundColor = .gray
        textview.isSelectable = false
        textview.isEditable = false
        return textview
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
        backgroundColor = .white
        setupViews()
    }
}

extension BestSellerCell {
    private func setupViews(){
        setupImageView()
        setupLabelView()
        setupTextView()
    }
   private func setupImageView(){
    addSubview(imageObj)
    imageObj.translatesAutoresizingMaskIntoConstraints = false
    imageObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    imageObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
    imageObj.heightAnchor.constraint(equalToConstant: 100).isActive = true
    imageObj.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    private func setupLabelView(){
        addSubview(titleLabelObj)
        titleLabelObj.translatesAutoresizingMaskIntoConstraints = false
        titleLabelObj.topAnchor.constraint(equalTo: imageObj.bottomAnchor, constant: 11).isActive = true
        titleLabelObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabelObj.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true 
    }
    private func setupTextView(){
        addSubview(bestSellerBookDescriptionTxtViewObj)
bestSellerBookDescriptionTxtViewObj.translatesAutoresizingMaskIntoConstraints = false
        bestSellerBookDescriptionTxtViewObj.topAnchor.constraint(equalTo: titleLabelObj.bottomAnchor, constant: 0).isActive = true
    bestSellerBookDescriptionTxtViewObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    bestSellerBookDescriptionTxtViewObj.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    bestSellerBookDescriptionTxtViewObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
}
