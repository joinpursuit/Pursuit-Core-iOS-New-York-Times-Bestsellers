//
//  FavesCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavesCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white 
        setUpImageView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public lazy var favesImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.image = UIImage.init(named: "icons8-book-50")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    public lazy var weeksLabel: UILabel = {
        let weeksLabel = UILabel()
        weeksLabel.text = ""
        weeksLabel.textAlignment = .left
        weeksLabel.backgroundColor = .white
        return weeksLabel
    }()
    
    public lazy var textViewDescription: UITextView = {
        let textDescription = UITextView()
        textDescription.text = "well hello midnight"
        return textDescription
    }()
    
    public func configureCell(favoriteBook: FavoriteBook){
        weeksLabel.text = favoriteBook.bookName
        textViewDescription.text = favoriteBook.description
        
        if let imageData = favoriteBook.imageData {
            DispatchQueue.global().async {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.favesImageView.image = image
                }
            }
        }
        
    }
    
    
    func setUpImageView() {
        addSubview(favesImageView)
        addSubview(weeksLabel)
        addSubview(textViewDescription)
        
        favesImageView.translatesAutoresizingMaskIntoConstraints = false
        weeksLabel.translatesAutoresizingMaskIntoConstraints = false
        textViewDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favesImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            favesImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0), favesImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35), weeksLabel.topAnchor.constraint(equalTo: favesImageView.bottomAnchor, constant: 8), favesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11)] )
        
        NSLayoutConstraint.activate([
            weeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),  weeksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),textViewDescription.topAnchor.constraint(equalTo: weeksLabel.bottomAnchor, constant: 0)
            ])
        NSLayoutConstraint.activate([
            textViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),  textViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5), textViewDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0), textViewDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            ])
        
        
    }
}
