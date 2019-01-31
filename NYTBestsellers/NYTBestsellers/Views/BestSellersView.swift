//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {
    lazy var myCollectionView: UICollectionView = {
        //create the layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 280)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        layout.scrollDirection = .horizontal
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .lightText
        return cv
        
}()
    
    lazy var myPicker: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .white
       
        return picker
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
    private func commonInit(){
        backgroundColor = .white
        self.myCollectionView.register(BSCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setUpViews()
    }
    private func setUpViews() {
        setupCollectionView()
        setUpPickerView()
    }
    private func setupCollectionView() {
        addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        myCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        myCollectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        myCollectionView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    private func setUpPickerView() {
        addSubview(myPicker)
        myPicker.translatesAutoresizingMaskIntoConstraints = false
        myPicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myPicker.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor, constant: 0).isActive = true
        myPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        myPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        myPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
    }
}
