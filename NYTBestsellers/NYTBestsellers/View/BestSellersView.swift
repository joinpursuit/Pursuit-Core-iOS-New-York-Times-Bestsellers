//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 300)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 22, left: 11, bottom: 22, right: 11)
        
        let cv = UICollectionView.init(frame: frame, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.963193357, green: 0.9697449803, blue: 0.8973967433, alpha: 1)
        return cv
    }()
    
    public lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .white
        return pv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(collectionView)
        addSubview(pickerView)
        setupContraints()
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
         collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
         collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
         collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            ].forEach{ $0.isActive = true }
        [pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
         pickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
         pickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
         pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            ].forEach{ $0.isActive = true }
    }


}
