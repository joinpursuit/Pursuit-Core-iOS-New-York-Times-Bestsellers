//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit




class DetailView: UIView {
    lazy var detailImage: UIImageView = {
        let background = UIImageView()
        let bg = UIImage(named: "BookPlaceHolder")
        background.image = bg
        return background
    }()
    
    
    lazy var detailLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
        mylabel.backgroundColor = .black
        mylabel.text = "Book test"
        mylabel.textColor = .white
        return mylabel
    }()
    
    lazy var detailTextView: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .white
        myTextView.backgroundColor = .gray
        myTextView.textAlignment = .center
        myTextView.text = "Book description test"
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        detailImageConstrains()
        detailLabelConstrains()
        textViewConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func detailImageConstrains() {
        addSubview(detailImage)
      detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       detailImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
      detailImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
       detailImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    private func detailLabelConstrains() {
        addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 11).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    private func textViewConstrains() {
        addSubview(detailTextView)
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        detailTextView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 20).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        detailTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        detailTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
    }
}
