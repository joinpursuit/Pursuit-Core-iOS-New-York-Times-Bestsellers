//
//  BestsellersView.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersView: UIView {
    // don't put network helper in view
    
    public lazy var bestsellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 350)
        layout.sectionInset = UIEdgeInsets.init(top: 22, left: 11, bottom: 22, right: 22)
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        // cv.delegate = self
        //cv.dataSource = self
        
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return collectionView
    }()
    
    public lazy var bestsellersPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .gray
        return pickerView
    }()
    
    override init(frame: CGRect) {
        // set yourself up like any UIView
        super.init(frame: UIScreen.main.bounds)
        //our custom set up
        addSubview(bestsellersPickerView)
        addSubview(bestsellerCollectionView)
        
        bestsellerCollectionView.register(BestsellersCollectionCell.self, forCellWithReuseIdentifier: "BestsellersCell")
        
        setupBestCollectionView()
        setupBestsellersPickerView()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // super.init(coder: aDecoder)
    }
    private func commonInit() {
        backgroundColor = .blue
    }
    
    
    func setupBestCollectionView() {
        addSubview(bestsellerCollectionView)
        bestsellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bestsellerCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            bestsellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bestsellerCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            ])
    }
    
    func setupBestsellersPickerView() {
        self.addSubview(bestsellersPickerView)
        bestsellersPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bestsellersPickerView.topAnchor.constraint(equalTo: bestsellerCollectionView.bottomAnchor, constant: 20),bestsellersPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),bestsellersPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),bestsellersPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),bestsellersPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),bestsellersPickerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12)])
    }
    
}


