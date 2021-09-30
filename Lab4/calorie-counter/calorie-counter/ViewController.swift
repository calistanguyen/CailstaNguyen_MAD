//
//  ViewController.swift
//  calorie-counter
//
//  Created by Calista Nguyen on 9/28/21.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var calorieTextField: UITextField!
    @IBOutlet weak var servingLabel: UILabel!
    @IBOutlet weak var servingCounter: UIStepper!
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    
    var totalCalories = 0.0
    
    override func viewDidLoad() {
        calorieTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        //keyboard dismiss on tap: https://www.codegrepper.com/code-examples/swift/tap+on+screen+to+dismiss+keyboard+swift
        self.dismissKeyboardOnTap()
        // Do any additional setup after loading the view.
    }
    
    func updateTotalCalories() {
        //check if string in calorie text field is a number
        if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: calorieTextField.text!)) && calorieTextField.text != ""{
            totalCaloriesLabel.text = String(Float(servingCounter.value) * Float(calorieTextField.text!)!)
        } else {
            //create a UIAlertController object
            let alert=UIAlertController(title: "Error", message: "The number of calories must be a positive whole number", preferredStyle: UIAlertController.Style.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            let okAction=UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.calorieTextField.text = ""
                self.totalCaloriesLabel.text = ""
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        totalCaloriesLabel.sizeToFit()
    }


    @IBAction func updateServings(_ sender: UIStepper) {
        if sender.value == 1{
            servingLabel.text = "1 serving"
        }else {
            servingLabel.text = String(servingCounter.value) + " servings"
        }
        servingLabel.sizeToFit()
        updateTotalCalories()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != ""{
            updateTotalCalories()
        }else{
            totalCaloriesLabel.text = ""
        }
    }
}

extension UIViewController {
    func dismissKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
