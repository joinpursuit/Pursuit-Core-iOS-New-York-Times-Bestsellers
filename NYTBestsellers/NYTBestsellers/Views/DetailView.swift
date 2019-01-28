//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var detailImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        return iv
    }()
    
    public lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    public lazy var detailTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Description..."
        tv.isEditable = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupDetail()
    }
}
extension DetailView {
    private func setupDetail() {
        setupDetailImageView()
        setupDetailLabel()
        setupDetailTextView()
    }
    
    private func setupDetailImageView () {
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        detailImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
    }
    
    private func setupDetailLabel () {
        addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 11).isActive = true
        
    }
    private func setupDetailTextView () {
        addSubview(detailTextView)
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        detailTextView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 11).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        detailTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}

