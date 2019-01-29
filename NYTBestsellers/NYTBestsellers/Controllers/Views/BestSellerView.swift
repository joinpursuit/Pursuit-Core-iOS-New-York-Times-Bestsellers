//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol GetBookDetail: AnyObject {
    func bookDetail()
}
class BestSellerView: UIView {
    
    weak var delegate: GetBookDetail?
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)

        cv.backgroundColor = .gray
        return cv
    }()
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .blue
        return picker
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
    private func commonInit(){
        self.collectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        backgroundColor = .yellow
        setUpConstraints()
    }
}

extension BestSellerView {
    private func setUpConstraints() {
        setupCollectionView()
        setupPickerView()
    }
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    private func setupPickerView(){
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        pickerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
    }
}
