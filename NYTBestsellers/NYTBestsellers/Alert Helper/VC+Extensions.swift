//
//  VC+Extensions.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}
