//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var detailBookImage: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    func setupViews() {
        setImage()
    }
    
    func setImage(){
        addSubview(detailBookImage)
        detailBookImage.translatesAutoresizingMaskIntoConstraints = false
        detailBookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        detailBookImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        detailBookImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

