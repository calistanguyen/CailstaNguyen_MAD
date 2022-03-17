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
    
    override func viewDidAppear(_ animated: Bool) {
        plant.text = plantValue
        location.text = locationValue
        picker.selectRow(getDayRow(pickerValue), inComponent: 0, animated: false)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        let date = dateFormatter.date(from:dateValue)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let finalDate = calendar.date(from:components)
        datePicker.date = finalDate!
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
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
