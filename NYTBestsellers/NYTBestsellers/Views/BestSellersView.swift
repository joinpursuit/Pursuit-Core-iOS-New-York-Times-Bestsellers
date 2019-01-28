//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {
    
    public lazy var bestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        let cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        return cv
    }()
    
    public lazy var genrePickerView: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        return picker
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
        backgroundColor = .white
        self.bestSellerCollectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setupView()
    }
}

extension BestSellersView {
    private func setupView() {
        setupCollectionView()
        setupPickerView()
    }
    
    private func setupCollectionView() {
        addSubview(bestSellerCollectionView)
        bestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bestSellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bestSellerCollectionView.heightAnchor.constraint(equalToConstant: 380).isActive = true
        bestSellerCollectionView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    private func setupPickerView() {
        addSubview(genrePickerView)
        genrePickerView.translatesAutoresizingMaskIntoConstraints = false
        genrePickerView.topAnchor.constraint(equalTo: bestSellerCollectionView.bottomAnchor, constant: 0).isActive = true
        genrePickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        genrePickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        genrePickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}


