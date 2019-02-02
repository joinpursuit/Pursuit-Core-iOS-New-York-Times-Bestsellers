//
//  FavoriteCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol FavoriteCollectionViewCellDelegate: AnyObject {
    func presentAlertController(alertController: UIAlertController)
    func updateCell(favorite: [FavoriteBooks])
}


class FavoriteCollectionViewCell: UICollectionViewCell {
    weak var delegate: FavoriteCollectionViewCellDelegate?
    lazy var favoriteCollectionCellImage: UIImageView = {
        let background = UIImageView()
      let bg = UIImage(named: "BookPlaceHolder")
        background.image = bg
        return background
    }()
    
    
    lazy var favoriteCollectionLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
        mylabel.backgroundColor = .black
        mylabel.text = "Book test"
        mylabel.textColor = .white
        return mylabel
    }()
    
    lazy var favoriteTextView: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .white
        myTextView.backgroundColor = .gray
        myTextView.textAlignment = .center
        myTextView.text = "Book description test"
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
    }()
    
    
    lazy var button: UIButton = {
        let myButton = UIButton()
       myButton.setTitle("...", for: .normal)
      myButton.backgroundColor = .white
        myButton.setTitleColor(.black, for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Helvetica", size: 50)
        myButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return myButton
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .blue
        layer.cornerRadius = 10
        cellImageConstrains()
        labelConstrains()
        favoriteTextViewContrains()
        favoriteButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  @objc private func buttonPressed() {
    let alertController = UIAlertController(title: "Options", message: "", preferredStyle: .actionSheet)
    let delete = UIAlertAction(title: "Delete", style: .destructive) { delete in
       BookDataManager.delete(atIndex: self.button.tag)
        self.delegate?.updateCell(favorite: BookDataManager.fetchFavoriteBooksFromDocumentsDirectory())
    }
    alertController.addAction(delete)
    self.delegate?.presentAlertController(alertController: alertController)
    }
    
    
    private func cellImageConstrains() {
        addSubview(favoriteCollectionCellImage)
        favoriteCollectionCellImage.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionCellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        favoriteCollectionCellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true
        favoriteCollectionCellImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        favoriteCollectionCellImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
    }
    
    private func labelConstrains() {
        addSubview(favoriteCollectionLabel)
        favoriteCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        favoriteCollectionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        favoriteCollectionLabel.topAnchor.constraint(equalTo: favoriteCollectionCellImage.bottomAnchor, constant: 10).isActive = true
    }
    
    private func favoriteTextViewContrains() {
        addSubview(favoriteTextView)
        favoriteTextView.translatesAutoresizingMaskIntoConstraints = false
        favoriteTextView.leadingAnchor.constraint(equalTo: favoriteCollectionLabel.leadingAnchor).isActive = true
        favoriteTextView.trailingAnchor.constraint(equalTo: favoriteCollectionLabel.trailingAnchor).isActive = true
        favoriteTextView.topAnchor.constraint(equalTo: favoriteCollectionLabel.bottomAnchor, constant: 5).isActive = true
        favoriteTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
    private func favoriteButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        button.leadingAnchor.constraint(equalTo: favoriteCollectionCellImage.trailingAnchor, constant: 5).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    }
}
