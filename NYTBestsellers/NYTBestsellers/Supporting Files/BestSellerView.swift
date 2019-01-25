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
    lazy var collectionViewObj: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize.init(width: 300, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        backgroundColor = .blue
       collectionView.dataSource = self
       collectionView.delegate = self
        return collectionView
    }()
    lazy var pickerViewObj: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = UIColor.white
        pickerView.dataSource = self
        pickerView.delegate =  self
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
        
        addSubview(collectionViewObj)
        collectionViewObj.register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
//        addSubview(pickerViewObj)
        setupViews()
       
    }
   private func setupViews(){
    setupCollectionViewContraints()
    setupPickerContraints()
    
    }
    private func setupCollectionViewContraints(){
        collectionViewObj.translatesAutoresizingMaskIntoConstraints = false
        collectionViewObj.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionViewObj.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        collectionViewObj.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
    }
    private func setupPickerContraints(){
        pickerViewObj.translatesAutoresizingMaskIntoConstraints = false
        /*
         textViewObj.translatesAutoresizingMaskIntoConstraints = false
         textViewObj.topAnchor.constraint(equalTo: mylabelObj.bottomAnchor, constant: 11).isActive = true
         textViewObj.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 11).isActive = true
         textViewObj.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -11).isActive = true
         textViewObj.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -11).isActive = true
         */
    }
}

extension BestSellerView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell else {return UICollectionViewCell()}
        return cell
    }
}

//extension BestSellerView: UIPickerViewDataSource, UIPickerViewDelegate {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//     re
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }
//    
//    
//}
