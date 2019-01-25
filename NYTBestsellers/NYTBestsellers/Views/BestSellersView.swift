//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {
    lazy var myCollectionView: UICollectionView = {
        //create the layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 280)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        layout.scrollDirection = .horizontal
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        return cv
        
}()
    
    lazy var myPicker: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .lightGray
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
       commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        backgroundColor = .yellow
        self.myCollectionView.register(BSCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setUpViews()
    }
    private func setUpViews() {
        setupCollectionView()
        setUpPickerView()
    }
    private func setupCollectionView() {
        addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        myCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        myCollectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        myCollectionView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    private func setUpPickerView() {
        addSubview(myPicker)
        myPicker.translatesAutoresizingMaskIntoConstraints = false
        myPicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myPicker.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor, constant: 0).isActive = true
        myPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        myPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        myPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
    }
}
extension BestSellersView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BSCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    
    
}
extension BestSellersView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return String(row)
    }
    
}

