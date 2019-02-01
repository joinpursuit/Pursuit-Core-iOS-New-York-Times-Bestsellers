//
//  OptionsView.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class OptionsView: UIView {


    public lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .gray
        return pv
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
        addSubview(pickerView)
        pickerViewConstraints()
    }

    
    func pickerViewConstraints(){
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        pickerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
       
    }
    
    
   

}
