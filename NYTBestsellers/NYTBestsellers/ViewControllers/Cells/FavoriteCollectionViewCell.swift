//
//  FavoriteCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol AlertPresentingDelegate: AnyObject {
    func present(view: UIAlertController)
    func reloadData()
}

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    weak var presenter: AlertPresentingDelegate! = nil
    
    public lazy var imageView: UIImageView = {
        let bookImage = UIImageView()
        bookImage.backgroundColor = .green
        return bookImage
    }()
    
    public lazy var optionsButton: UIButton = {
        let button = UIButton()
        button.setTitle(".....", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(alertController), for: .touchUpInside)
     
        return button
    }()
    
    public lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
        
    }()
    
    public lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.text = "Text............."
        textView.textColor = .red
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.addSubview(imageView)
        self.addSubview(optionsButton)
        self.addSubview(label)
        self.addSubview(textView)
        setImageViewConstrains()
        setButtonConstrains()
        setLabelConstrains()
        setTextViewConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    @objc func alertController(){
        
        let alert = UIAlertController(title: "Options", message: "Select an action", preferredStyle: .actionSheet)
        let delete = UIAlertAction.init(title: "Delete", style: .default){ (alert: UIAlertAction) in
            FavoritedBookModel.delete(index: self.optionsButton.tag)
            self.presenter.reloadData()
        }
        alert.addAction(delete)
        presenter.present(view: alert)
    }
    
    
    
    func setImageViewConstrains(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
    }
    
    func setButtonConstrains(){
    optionsButton.translatesAutoresizingMaskIntoConstraints = false
        optionsButton.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        optionsButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 55).isActive = true
        optionsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    
    func setLabelConstrains(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        
    }
    
    func setTextViewConstrains(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
      
    }
    
    
    
}
