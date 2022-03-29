//
//  AddPlantViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/28/22.
//

import UIKit

class AddPlantViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var addedName = String()
    var addedLocation = String()
    var addedWaterDay = "Monday"
    var addedFertilizeDate = String()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addedWaterDay = days[row]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        saveButton.isEnabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.addTarget(self, action: #selector(AddPlantViewController.textFieldDidChange(_:)), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(AddPlantViewController.textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    //https://stackoverflow.com/questions/28394933/how-do-i-check-when-a-uitextfield-changes
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(nameTextField.text == "" || locationTextField.text == ""){
            saveButton.isEnabled = false
        }else {
            saveButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "savesegue") {
            addedName = nameTextField.text!
            addedLocation = locationTextField.text!
            let dateFormatter = DateFormatter();
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            addedFertilizeDate = dateFormatter.string(from: datePicker.date)
            
        }
    }


}
