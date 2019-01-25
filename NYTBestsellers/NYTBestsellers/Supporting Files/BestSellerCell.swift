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
        setupViews()
    }
}

extension BestSellerCell {
    private func setupViews(){
        setupImageView()
    }
   private func setupImageView(){
    addSubview(imageObj)
    imageObj.translatesAutoresizingMaskIntoConstraints = false
    imageObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    imageObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
    imageObj.heightAnchor.constraint(equalToConstant: 100).isActive = true
    imageObj.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
