//
//  MenuViewController.swift
//  Cafe Cali
//
//  Created by Calista Nguyen on 1/26/22.
//

import UIKit

class MenuViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuPicker: UIPickerView!
    
    let menuDataLoader = DataLoader()
    var types = [String]()
    var items = [String]()
    
    let typePicker = 0
    let itemsPicker = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuDataLoader.loadData(filename: "menu");
        types = menuDataLoader.getTypes();
        items = menuDataLoader.getItems(index: 0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == typePicker {
            return types.count;
        } else {
            return items.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == typePicker {
            return types[row]
        } else {
            return items[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == typePicker {
            items = menuDataLoader.getItems(index: row)
            menuPicker.reloadComponent(itemsPicker)
            menuPicker.selectRow(0, inComponent: itemsPicker, animated: true)
            
            if(types[row] == "Coffee Drinks") {
                menuImage.image = UIImage(named: "coffee")
            } else if (types[row] == "Non-Coffee Drinks") {
                menuImage.image = UIImage(named: "tea")
            } else {
                menuImage.image = UIImage(named: "sandwich")
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//    https://makeapppie.com/2014/10/21/swift-swift-formatting-a-uipickerview/
        
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = .left
        if component == typePicker {
            pickerLabel.text = types[row]
        } else {
            pickerLabel.text = items[row]
            pickerLabel.layoutMargins = UIEdgeInsets.init(top: 0, left: 12, bottom: 0, right: 0)
        }
        return pickerLabel
    }
    

}
