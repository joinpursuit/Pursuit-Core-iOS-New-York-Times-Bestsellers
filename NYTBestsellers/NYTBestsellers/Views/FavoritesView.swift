//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

    class FavoritesView: UIView {
        
        public lazy var colloectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            layout.itemSize = CGSize.init(width: 400, height: 400)
            layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
            layout.scrollDirection = .vertical
            collectionView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            return collectionView
        }()
        
        
        override init(frame: CGRect) {
            super .init(frame: UIScreen.main.bounds)
            
            colloectionView.dataSource = self
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
    extension FavoritesView {
        private func setUpView(){
            setUpCollectionView()
            
        }
        func setUpCollectionView(){
            addSubview(colloectionView)
            colloectionView.translatesAutoresizingMaskIntoConstraints = false
            colloectionView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor).isActive = true
            colloectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            colloectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
        }
        
       
        
        
    }
    extension FavoritesView: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 30
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath) as? FavoritesCell else { return UICollectionViewCell() }
            cell.label.text = "Weeks on Best Seller"
            cell.image.image = UIImage.init(named: "icons8-open_book")
            cell.textView.text = "Success"
            return cell
        }
        
        
    }


