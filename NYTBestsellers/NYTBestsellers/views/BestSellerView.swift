//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class BestSellerView: UIView {
    
    let colors:[String] = ["blue","red","yellow"]
    
    lazy var backgroundImage: UIImageView = {
        let background = UIImageView()
        let bg = UIImage(named: "nyLibrary")
        background.image = bg
        
        return background
    }()
    
    
    lazy var BestSellerPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .clear
        
        return pickerView
    }()
    
    lazy var BestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let myCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCollectionView.backgroundColor = .green
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        
        return myCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        //    setconstrains()
        backgroundColor = .white
        pickerConstrains()
        collectionviewConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setconstrains()  {
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func collectionviewConstrains() {
        addSubview(BestSellerCollectionView)
        BestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        BestSellerCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        BestSellerCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        BestSellerCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
        BestSellerCollectionView.bottomAnchor.constraint(equalTo: BestSellerPickerView.topAnchor, constant: 10).isActive = true
        
    }
    
    func pickerConstrains() {
        addSubview(BestSellerPickerView)
        BestSellerPickerView.translatesAutoresizingMaskIntoConstraints = false
        BestSellerPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
      BestSellerPickerView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        BestSellerPickerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension BestSellerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    
}


