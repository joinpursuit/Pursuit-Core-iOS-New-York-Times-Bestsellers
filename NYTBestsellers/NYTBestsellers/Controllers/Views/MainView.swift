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
        layout.itemSize = CGSize.init(width: 180, height: 250)
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
            backgroundColor = .yellow
        myCollectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "BooksCollectionViewCell")
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        backgroundColor = .blue
        //setConstraints()
    }
    
    func setConstraints() {
        self.addSubview(myCollectionView)
        
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            myCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)])
        
        self.addSubview(bestSellerPickerView)
        
        bestSellerPickerView.translatesAutoresizingMaskIntoConstraints = false
        bestSellerPickerView.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor, constant: 20).isActive = true
        bestSellerPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
        bestSellerPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
         bestSellerPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -8).isActive = true
        bestSellerPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bestSellerPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true 
    
        
        
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
