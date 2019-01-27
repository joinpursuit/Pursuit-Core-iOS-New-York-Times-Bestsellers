//
//  amazonWebView.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import WebKit
class AmazonWebView: WKWebView {

    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: UIScreen.main.bounds, configuration: configuration)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
