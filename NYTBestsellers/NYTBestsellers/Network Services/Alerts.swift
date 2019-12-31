//
//  Alerts.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 12/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
extension UIViewController {
  func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
  func alreadyFavorited(title: String, message: String) {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
      alertController.addAction(okAction)
      present(alertController,animated: true, completion: nil)
      let when = DispatchTime.now() + 5
      DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alertController.dismiss(animated: true, completion: nil)
      }
  }

}
