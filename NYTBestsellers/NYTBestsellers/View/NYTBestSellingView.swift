//
//  NYTBestSellingView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestSellingView: UIView {
    lazy var bestsellersCollectionView: UICollectionView = {
       let cv = UICollectionView()
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .yellow
        return cv
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
        backgroundColor = .blue
        setupViews()
    }
    

}

extension NYTBestSellingView {
    private func setupViews() {
        setupBestSellingCollectionView()
        setupCategoryPicker()
    }
    
    private func setupBestSellingCollectionView() {
        
    }
    
    private func setupCategoryPicker() {
        
    }
}

extension NYTBestSellingView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestsellersCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 250/1.5, height: 350/1.5)
    }
}
