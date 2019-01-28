//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
/*
 let layout = UICollectionViewFlowLayout()
 layout.itemSize = CGSize.init(width: 100, height: 100)
 layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
 cv.dataSource = self
 cv.delegate = self
 */

class BestSellerView: UIView {
   
    lazy var collectionViewCellObj: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize.init(width: 300, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        backgroundColor = .white
      
        return collectionView
    }()
    lazy var pickerViewObj: UIPickerView = {
        let pickerView = UIPickerView()
       
        pickerView.backgroundColor = UIColor.white
        backgroundColor = .white
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
    private func commonInit(){
        backgroundColor = .white
        addSubview(collectionViewCellObj)
        addSubview(pickerViewObj)
        collectionViewCellObj.register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setupViews()
    }
   private func setupViews(){
    setupCollectionViewContraints()
    setupPickerContraints()
    
    }
    private func setupCollectionViewContraints(){
        collectionViewCellObj.translatesAutoresizingMaskIntoConstraints = false
        collectionViewCellObj.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionViewCellObj.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        collectionViewCellObj.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        backgroundColor = .white
        
    }
    private func setupPickerContraints(){
        
        pickerViewObj.translatesAutoresizingMaskIntoConstraints = false
        pickerViewObj.topAnchor.constraint(equalTo: collectionViewCellObj.bottomAnchor, constant: 11).isActive = true
        pickerViewObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        pickerViewObj.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        pickerViewObj.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 11).isActive = true
        
    }
}

