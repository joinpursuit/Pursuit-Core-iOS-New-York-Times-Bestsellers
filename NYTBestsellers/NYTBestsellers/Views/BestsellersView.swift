//
//  BestsellersView.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersView: UIView {

    lazy var bestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 150)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        let bscv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        bscv.register(BestsellersCollectionViewCell.self, forCellWithReuseIdentifier: "BestsellersCell")
        bscv.backgroundColor = .purple
        
        return bscv
        
    }()
    
    lazy var bestSellerPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .gray
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .green
        setConstraints()
    }
    
    
    
    func setConstraints() {
        self.addSubview(bestSellerCollectionView)
        bestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        bestSellerCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        bestSellerCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.addSubview(bestSellerPickerView)
        bestSellerPickerView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerPickerView.topAnchor.constraint(equalTo: bestSellerCollectionView.bottomAnchor, constant: 20).isActive = true
        bestSellerPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
        bestSellerPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        bestSellerPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        bestSellerPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bestSellerPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
    }
   

}


