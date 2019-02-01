//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
class BestSellerView: UIView {
    
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .gray
        return pv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    
    private func commonInit() {
        setupCollectionView()
        setupPickerView()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionview.register(BestSellerCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    
    
}
extension BestSellerView {

    private func setupCollectionView(){

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0 ,left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 200, height: 400)
        
        collectionview = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionview.showsHorizontalScrollIndicator = false
    }
    

    private func setupPickerView() {
        addSubview(pickerView)
        addSubview(collectionview)
        pickerViewConstraints()
        collectionViewConstraints()
    }

    private func collectionViewConstraints(){
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }

    private func pickerViewConstraints(){
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6) .isActive = true
    }
}
