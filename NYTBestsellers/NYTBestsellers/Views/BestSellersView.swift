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
        cv.dataSource = self
        return cv
    }()
    
    public lazy var genrePickerView: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .blue
        picker.dataSource = self
        picker.delegate = self
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
        backgroundColor = .yellow
        self.bestSellerCollectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setupView()
        setupPickerView()
        
    }
    
    
    
}

extension BestSellersView {
    private func setupView() {
       setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(bestSellerCollectionView)
        bestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bestSellerCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bestSellerCollectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
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

extension BestSellersView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
extension BestSellersView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "hello"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
}
