//
//  BestsellersCollectionCell.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersCollectionCell: UICollectionViewCell {
    
    
    lazy var bookImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "bookPlaceHolder")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        //addSubview(bookImageView)
        setContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContraints() {
        addSubview(bookImageView)
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0.9999),
            bookImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -60),
            heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50), bookImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30)])
    }
}
