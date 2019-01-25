//
//  MainView.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainView: UIView {
    
public lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets.init(top: 22, left: 11, bottom: 22, right: 22)
        
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
    layout.scrollDirection = .horizontal
    cv.backgroundColor = .blue
        return cv
    }()

    public lazy var bestSellerPickerView: UIPickerView = {
        let bestPickerView = UIPickerView()
        bestPickerView.backgroundColor = .red 
        return bestPickerView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(myCollectionView)
            backgroundColor = .blue
        myCollectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "BooksCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension MainView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionViewCell", for: indexPath) as? BooksCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
}
