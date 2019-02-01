//
//  OptionsVC.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class OptionsVC: UIViewController {

    var optionsView = OptionsView()
    
    var category = [BookListName.resultsWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.optionsView.pickerView.reloadAllComponents()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        view.addSubview(optionsView)
        optionsView.pickerView.dataSource = self
        optionsView.pickerView.delegate = self
    }
    func getData(){
        APIClient.getListNames { (error, categories) in
            if let error = error {
                print(error)
            }
            if let categories = categories {
                self.category = categories
            }
        }
    }

}
extension OptionsVC : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(category[row].listName, forKey: Constants.userDefaults)
        UserDefaults.standard.set(row, forKey: Constants.rowDefaults)
    }
}
