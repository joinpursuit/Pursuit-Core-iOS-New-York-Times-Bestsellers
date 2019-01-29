//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let settingsView = SettingsView()
    var genres = [ListNames]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.pickerView.reloadAllComponents()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        navigationItem.title = "Settings"
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        updateSettings()
    }

    func updateSettings(){
        NYTAPIClient.getGenre { (error, data) in
            if let error = error {
                print("SettingsVC Error: \(error)")
            } else if let data = data {
                self.genres = data
                if let pickerRow = (UserDefaults.standard.object(forKey: DefaultGenre.pickerRow) as? String) {
                    DispatchQueue.main.async {
                        self.settingsView.pickerView.selectRow(Int(pickerRow)!, inComponent: 0, animated: true)
                    }
                }
            }
        }
    }
}
extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let alert = UIAlertController(title: "Save?", message: "Save \(genres[row].list_name) to default search settings?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            UserDefaults.standard.set(self.genres[row].list_name, forKey: DefaultGenre.defaultGenre)
            UserDefaults.standard.set(String(row), forKey: DefaultGenre.pickerRow)
            let alert2 = UIAlertController(title: "Saved!", message: "\(self.genres[row].list_name) has been saved to \"Default Genre\"", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert2, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
