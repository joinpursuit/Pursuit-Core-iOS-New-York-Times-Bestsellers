//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class BestSellerView: UIView {
    lazy var backgroundImage: UIImageView = {
        let background = UIImageView()
        let bg = UIImage(named: "nyLibrary")
        background.image = bg
        return background
    }()
    
    
    lazy var bestSellerPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .clear
        return pickerView
    }()
    
    lazy var BestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        let myCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
      myCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
myCollectionView.backgroundColor = .green
        myCollectionView.layer.cornerRadius = 10
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        return myCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
//         setconstrains()
//        addBlur()
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
        BestSellerCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        BestSellerCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        BestSellerCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
        BestSellerCollectionView.bottomAnchor.constraint(equalTo: bestSellerPickerView.topAnchor, constant: 10).isActive = true
    }
    
    func pickerConstrains() {
        addSubview(bestSellerPickerView)
        bestSellerPickerView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
      bestSellerPickerView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        bestSellerPickerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addBlur() {
        let blurrEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurrEffect)
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(effectView)
    }
}




