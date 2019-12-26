//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerView: UIView {
    
    
    public lazy var colloectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return collectionView
    }()
    
    public lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
      pickerView.backgroundColor = .white
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: UIScreen.main.bounds)
        
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        backgroundColor = .white
        setUpView()
    }
}
extension BestSellerView {
    private func setUpView(){
        setUpCollectionView()
        setUpPickerView()
    }
    func setUpCollectionView(){
        addSubview(colloectionView)
        colloectionView.translatesAutoresizingMaskIntoConstraints = false
        colloectionView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor).isActive = true
        colloectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        colloectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
    }
    
    func setUpPickerView(){
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
    }
    
    
}

