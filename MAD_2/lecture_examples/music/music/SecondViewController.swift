//
//  SecondViewController.swift
//  music
//
//  Created by Calista Nguyen on 1/13/22.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var musicPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    let genre = ["Country", "Pop", "Rock", "Classical", "Alternative", "Hip hop", "EDM"]

    let decade = ["1950s", "1960s", "1980s", "1990s", "2000s", "2010s", "2020s"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return genre.count
        } else {
            return decade.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return genre[row]
        } else {
            return decade[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let genreRow = pickerView.selectedRow(inComponent: 0)
        let decadeRow = pickerView.selectedRow(inComponent: 1)
        
        choiceLabel.text = "You like \(genre[genreRow]) music from the \(decade[decadeRow])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
