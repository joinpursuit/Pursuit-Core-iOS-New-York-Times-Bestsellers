//
//  AmazonLinkView.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import WebKit

//class AmazonLinkView: UIView {
//    
//    public lazy var webView: WKWebView = {
//        let wv = WKWebView()
//        wv.backgroundColor = .white
//        return wv
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: UIScreen.main.bounds)
//        backgroundColor = .white
//        addSubview(webView)
//        setupConstraints()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupConstraints() {
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        [webView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1),
//         webView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1)
//            ].forEach{ $0.isActive = true }
//    }
//
//}
