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
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    
    public lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
   
   func setUpConstraints(){
    
    }

}
