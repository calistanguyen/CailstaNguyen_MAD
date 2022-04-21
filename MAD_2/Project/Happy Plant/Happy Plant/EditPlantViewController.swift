//
//  EditPlantViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 4/19/22.
//

import UIKit

class EditPlantViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var callback : ((Plant) -> Void)?
    
    var currentPlant: Plant?
    let dataHandler = DataHandler()
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var waterDayPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func save(_ sender: Any) {
        
        currentPlant?.name = nameTextField.text!
        currentPlant?.type = typeTextField.text!
        currentPlant?.location = locationTextField.text!
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        currentPlant?.dayToFertilize = dateFormatter.string(from: datePicker.date)
        dataHandler.updatePlant(plant: currentPlant!)
        callback?(currentPlant!)
        self.dismiss(animated: true, completion: nil)
        
    }
    func getDayPickerIdx() -> Int {
        switch(currentPlant?.waterDay) {
        case "Monday":
            return 0
        case "Tuesday":
            return 1
        case "Wednesday":
            return 2
        case "Thursday":
            return 3
        case "Friday":
            return 4
        case "Saturday":
            return 5
        default:
            return 6
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.semanticContentAttribute = .forceRightToLeft
        datePicker.subviews.first?.semanticContentAttribute = .forceRightToLeft
        
        typeTextField.text = currentPlant?.type
        nameTextField.text = currentPlant?.name
        locationTextField.text = currentPlant?.location
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let date = dateFormatter.date(from:currentPlant!.dayToFertilize)!
        datePicker.date = date
        waterDayPicker.selectRow(getDayPickerIdx(), inComponent:0, animated:true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentPlant?.waterDay = days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()

        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Quicksand-Regular", size: 18)

        // where data is an Array of String
        label.text = days[row]

        return label
    }
    
    //https://stackoverflow.com/questions/28394933/how-do-i-check-when-a-uitextfield-changes
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(nameTextField.text == "" || locationTextField.text == "" || typeTextField.text == ""){
            saveButton.isEnabled = false
        }else {
            saveButton.isEnabled = true
        }
    }
    
        
}
