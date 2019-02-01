//
//  BestsellersView.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersView: UIView {
    
    public lazy var bestsellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 350)
        layout.sectionInset = UIEdgeInsets.init(top: 22, left: 11, bottom: 22, right: 22)
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return collectionView
    }()
    
    public lazy var bestsellersPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        bestsellerCollectionView.register(BestsellersCollectionCell.self, forCellWithReuseIdentifier: "BestsellersCell")
        setupBestsellersView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setupBestsellersView() {
        addSubview(bestsellerCollectionView)
        self.addSubview(bestsellersPickerView)

        bestsellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bestsellersPickerView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            bestsellerCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            bestsellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bestsellerCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            ])
    
        NSLayoutConstraint.activate([bestsellersPickerView.topAnchor.constraint(equalTo: bestsellerCollectionView.bottomAnchor, constant: 20),bestsellersPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),bestsellersPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),bestsellersPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),bestsellersPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),bestsellersPickerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12)])
    }
    
}


