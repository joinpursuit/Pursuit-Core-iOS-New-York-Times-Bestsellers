//
//  FavoritesCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol FavoritesCollectionViewCellDelegate: AnyObject {
    func actionSheet(tag: Int)
}

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: FavoritesCollectionViewCellDelegate?

    
    public lazy var cellImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        return iv
    }()
    
    public lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cellTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Description..."
        return tv
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.setTitle("...", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.addTarget(self, action: #selector(cellButtonPressed), for: .touchUpInside)
        return button
    }()
    @objc func cellButtonPressed(_ sender: UIButton) {
        delegate?.actionSheet(tag: sender.tag)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupCells()
    }
}
extension FavoritesCollectionViewCell {
    private func setupCells() {
        setupCellImageView()
        setupCellLabel()
        setupCellTextView()
        setupCellButton()
    }
    
    private func setupCellImageView () {
        addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
        cellImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        cellImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
    }
    
    private func setupCellLabel () {
        addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        cellLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 11).isActive = true
        
    }
    private func setupCellTextView () {
        addSubview(cellTextView)
        cellTextView.translatesAutoresizingMaskIntoConstraints = false
        cellTextView.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 11).isActive = true
        cellTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        cellTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        cellTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    private func setupCellButton () {
        addSubview(cellButton)
        cellButton.translatesAutoresizingMaskIntoConstraints = false
        cellButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cellButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}
