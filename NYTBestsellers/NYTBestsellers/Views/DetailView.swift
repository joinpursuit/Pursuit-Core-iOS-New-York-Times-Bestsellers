//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol DetailViewDelegate: AnyObject {
    func favoritePressed()
    func amazonPressed()
}
class DetailView: UIView {
    
    weak var delegate: DetailViewDelegate?
    
    public lazy var favoriteButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Favorite", style: UIBarButtonItem.Style.plain, target: self, action: #selector(favoritePressed))
        return button
    }()
    @objc func favoritePressed() {
        delegate?.favoritePressed()
    }
    lazy var amazonButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "amazon"), for: .normal)
        //add action code
        button.addTarget(self, action: #selector(amazonPressed), for: .touchUpInside)
        return button
    }()
    @objc func amazonPressed() {
        delegate?.amazonPressed()
    }
    
    public lazy var detailImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        return iv
    }()
    public lazy var detailFavoritesImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        iv.isHidden = true
        return iv
    }()
    
    public lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public lazy var detailTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Description..."
        tv.font = UIFont.systemFont(ofSize: 13)
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
        setupDetailFavoriteImage()
        setupAmazonButton()
    }
    
    private func setupDetailImageView () {
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 85).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -85).isActive = true
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
        detailTextView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 55).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        detailTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        detailTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    private func setupDetailFavoriteImage () {
        addSubview(detailFavoritesImage)
        detailFavoritesImage.translatesAutoresizingMaskIntoConstraints = false
        detailFavoritesImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:  -11).isActive = true
        detailFavoritesImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.07).isActive = true
        detailFavoritesImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.10).isActive = true
        detailFavoritesImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    private func setupAmazonButton() {
        addSubview(amazonButton)
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        amazonButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        amazonButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        amazonButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}

