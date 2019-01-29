//
//  BaseView.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BaseView: UIView {
    public lazy var collectionView: UICollectionView = {
        let cellLayout = UICollectionViewFlowLayout()
            cellLayout.scrollDirection = .horizontal
            cellLayout.sectionInset =  UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
            cellLayout.itemSize = CGSize.init(width: 300, height: 300)
        let bestSellerCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        bestSellerCollectionView.backgroundColor = UIColor.init(red: 250, green: 250, blue: 250, alpha: 1)
        return bestSellerCollectionView
    }()
    
    
    public lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(collectionView)
        addSubview(pickerView)
        setCollectionViewsConstrains()
        setPickerViewConstrains()

        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CVCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
    }
    
    
    
    func setCollectionViewsConstrains(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setPickerViewConstrains(){
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(lessThanOrEqualTo: collectionView.bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }


}
