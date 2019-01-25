//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {
    
    lazy var myPickerView: UIPickerView = {
        var pickerView = UIPickerView()
        return pickerView
    }()
   
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        var collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
}

extension BestSellersView {
    private func setupViews() {
        setPickerView()
        setUpCollectionView()
    }
    private func setPickerView() {
        addSubview(myPickerView)
        myPickerView.translatesAutoresizingMaskIntoConstraints = false
        myPickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        myPickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myPickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    private func setUpCollectionView() {
       addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
}
