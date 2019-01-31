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
        pv.backgroundColor = .orange
        return pv
    }()
//
    
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
        backgroundColor = .white
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
        
        //layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20 ,left: 10, bottom: 20, right: 10)
        layout.itemSize = CGSize(width: 150, height: 300)
        
        collectionview = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = .black
    }
    

    private func setupPickerView() {
        addSubview(pickerView)
        addSubview(collectionview)
        pickerViewConstraints()
        collectionViewConstraints()
    }

    private func collectionViewConstraints(){
        collectionview.translatesAutoresizingMaskIntoConstraints = false

        collectionview.topAnchor.constraint(equalTo:topAnchor).isActive = true
        collectionview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }

    private func pickerViewConstraints(){
        pickerView.translatesAutoresizingMaskIntoConstraints = false

        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5) .isActive = true
    }


}
