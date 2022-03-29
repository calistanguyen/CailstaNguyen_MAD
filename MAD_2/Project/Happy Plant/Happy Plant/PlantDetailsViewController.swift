//
//  PlantDetailsViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/16/22.
//

import UIKit

class PlantDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var plantValue: String = ""
    var locationValue: String = ""
    var pickerValue: String = ""
    var dateValue: String = ""
    
    @IBOutlet weak var plant: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func edit(_ sender: UIBarButtonItem) {
        plant.isEnabled = true
        location.isEnabled = true
        picker.isUserInteractionEnabled = true
        datePicker.isEnabled = true
    }
    override func viewWillAppear(_ animated: Bool) {
        
        plant.isEnabled = false
        location.isEnabled = false
        picker.isUserInteractionEnabled = false
        datePicker.isEnabled = false
        plant.text = plantValue
        location.text = locationValue
        picker.selectRow(getDayRow(pickerValue), inComponent: 0, animated: false)
        
        print("CURR DATE \(dateValue)")
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let finalDate = dateFormatter.date(from: dateValue)
        
        datePicker.date = finalDate!
    }
    
    //MARK: picker view protocalls
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func getDayRow(_ day: String) -> Int {
        switch(day){
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


}
