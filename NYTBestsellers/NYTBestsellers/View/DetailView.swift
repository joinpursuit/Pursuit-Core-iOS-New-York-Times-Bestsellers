//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol ButtonDelegate: AnyObject{
    func amazonButtonPressed()
}
class DetailView: UIView {
    weak var delegate: ButtonDelegate!
    lazy var detailBookImage: UIImageView = {
        var image = UIImageView()
        return image
    }()
    lazy var detailBookTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Futura", size: 14)
        return textView
    }()
    lazy var favoriteView: UIView = {
       var view = UITextView()
        view.backgroundColor = .yellow
        view.addSubview(favoriteImage)
        view.isHidden = true
        return view

    }()
    lazy var favoriteImage: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    lazy var amazonButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "amazonLogo"), for: .normal)
        button.addTarget(self, action: #selector(amazonButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var bookLabel: UILabel = {
        var label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Futura", size: 20)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    @objc func amazonButtonPressed(){
        delegate.amazonButtonPressed()
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
        setTextView()
        setButton()
        setupLabel()
        setupFavView()
        setupFavImage()
        
    }
    
    func setImage(){
        addSubview(detailBookImage)
        detailBookImage.translatesAutoresizingMaskIntoConstraints = false
        detailBookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        detailBookImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        detailBookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        detailBookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setTextView() {
        addSubview(detailBookTextView)
        detailBookTextView.translatesAutoresizingMaskIntoConstraints = false
        detailBookTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        detailBookTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        detailBookTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        detailBookTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    func setButton(){
        addSubview(amazonButton)
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        amazonButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func setupLabel(){
        addSubview(bookLabel)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.topAnchor.constraint(equalTo: detailBookImage.bottomAnchor, constant: 10).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    func setupFavView(){
        addSubview(favoriteView)
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        favoriteView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        favoriteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        favoriteView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        favoriteView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupFavImage(){
//        addSubview(favoriteImage)
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        favoriteImage.centerXAnchor.constraint(equalTo: favoriteView.centerXAnchor).isActive = true
        favoriteImage.centerYAnchor.constraint(equalTo: favoriteView.centerYAnchor).isActive = true
        favoriteImage.heightAnchor.constraint(equalTo: favoriteView.heightAnchor, multiplier: 0.9).isActive = true
        favoriteImage.widthAnchor.constraint(equalTo: favoriteView.widthAnchor, multiplier: 0.9).isActive = true
    }
}

