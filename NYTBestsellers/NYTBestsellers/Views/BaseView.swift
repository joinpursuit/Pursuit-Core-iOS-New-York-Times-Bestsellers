//
//  BaseView.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    let numbers = ["January","Febraury","March","April","May","June","July"]

    public lazy var collectionView: UICollectionView = {
        
        let cellLayout = UICollectionViewFlowLayout()
            cellLayout.scrollDirection = .horizontal
            cellLayout.sectionInset =  UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
            cellLayout.itemSize = CGSize.init(width: 300, height: 300)
        
        let bestSellerCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        bestSellerCollectionView.backgroundColor = .green
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.delegate = self
        
    
        
        return bestSellerCollectionView
    }()
    
    
    public lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .red
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(collectionView)
        addSubview(pickerView)
        setCollectionViewsConstrains()
        setPickerViewConstrains()
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CVCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
    }
    
    
    
    func setCollectionViewsConstrains(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setPickerViewConstrains(){
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(lessThanOrEqualTo: collectionView.bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
      
        
    }
 

}

extension BaseView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
   
}

extension BaseView: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
    
}


