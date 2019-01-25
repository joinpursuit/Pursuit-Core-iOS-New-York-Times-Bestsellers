//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {

    public lazy var myBestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 300) // cell size
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(BestCollectionViewCell.self, forCellWithReuseIdentifier: "BestCollectionViewCell")
        cv.backgroundColor = .yellow
        return cv
    }()
    public lazy var myBestSellerPickerView: UIPickerView = {
        let cv = UIPickerView()
        cv.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return cv
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
        setupViews()
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }

    
}
extension BestSellersView {
    private func setupViews() {
        setupCollectionView()
        setupPickerView()
    }
    
    private func setupCollectionView () {
        addSubview(myBestSellerCollectionView)
        myBestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myBestSellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myBestSellerCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myBestSellerCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myBestSellerCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
    }
    
    private func setupPickerView () {
        addSubview(myBestSellerPickerView)
        myBestSellerPickerView.translatesAutoresizingMaskIntoConstraints = false
        myBestSellerPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        myBestSellerPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myBestSellerPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        myBestSellerPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
    }
}
