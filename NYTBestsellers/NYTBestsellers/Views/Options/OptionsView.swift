//
//  OptionsView.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class OptionsView: UIView {


    public lazy var optionsTitle: UILabel = {
        let label = UILabel()
        label.text = "Title of options"
        label.textColor = .white
        label.backgroundColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    
    private func commonInit() {
        backgroundColor = .blue
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

extension OptionsView {
    
    private func setupViews() {
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(optionsTitle)
        optionsTitle.translatesAutoresizingMaskIntoConstraints = false
        optionsTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        optionsTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        optionsTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
        
    }

}
