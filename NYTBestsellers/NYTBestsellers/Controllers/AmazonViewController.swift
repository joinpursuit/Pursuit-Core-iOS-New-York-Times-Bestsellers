//
//  AmazonViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import WebKit



class AmazonViewController: UIViewController{
    var amazonURL: URL!
    lazy var closeButton: UIButton = {
       var button = UIButton()
       button.setTitle("X", for: .normal)
       button.titleLabel?.font = UIFont(name: "Futura", size: 50)
       button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50.0)
       button.setTitleColor(.red, for: .normal)
       button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
       return button
    }()
    let amazonView = AmazonWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4410851884)
        setupButton()
        setupView()
        amazonView.load(URLRequest(url: amazonURL))
        amazonView.allowsBackForwardNavigationGestures = true

        
    }
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    func setupView(){
        view.addSubview(amazonView)
        
        amazonView.translatesAutoresizingMaskIntoConstraints = false
        amazonView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        amazonView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        amazonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        amazonView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    

    func setupButton(){
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
    }

}
