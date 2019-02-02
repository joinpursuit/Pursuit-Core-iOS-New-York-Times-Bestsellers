//
//  FavoriteView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol FavoriteViewDelegate: AnyObject {
    func numberOfFavoriteBooks() -> Int
    func configureCollectionViewCell(indexPath: IndexPath) -> UICollectionViewCell
}

class FavoriteView: UIView {
    
    weak var delegate: FavoriteViewDelegate?
    
    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 280, height: 350)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(hexString: "dfdfdf")
        cv.dataSource = self
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
        setupView()
    }
}

extension FavoriteView {
    private func setupView() {
        setupFavoriteCollectionView()
    }
    
    private func setupFavoriteCollectionView() {
        addSubview(favoriteCollectionView)
        favoriteCollectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        favoriteCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        favoriteCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
}

extension FavoriteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfFavoriteBooks() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = delegate?.configureCollectionViewCell(indexPath: indexPath) {
            cell.backgroundColor = UIColor(hexString: "f4f3f3")
            return cell
        }
        return UICollectionViewCell()
    }
}
