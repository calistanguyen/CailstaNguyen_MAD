//
//  CreateJournalEntry.swift
//  journal
//
//  Created by Calista Nguyen on 10/4/21.
//

import UIKit
import Foundation

class CreateJournalEntryViewController: UIViewController, UITextFieldDelegate{
    var cancelFlag = true
    
    @IBOutlet weak var journalEntryTextField: UITextField!
    @IBOutlet weak var journalEntryDatePicker: UIDatePicker!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalEntryTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

//  for keyboard adjusting view I referenced: https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool{
        if identifier == "cancel" {
            if cancelFlag == false {
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //https://cocoacasts.com/swift-fundamentals-how-to-convert-a-date-to-a-string-in-swift

        if segue.identifier == "submit"{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            let scene1VC = segue.destination as! JournalEntryListViewController
            scene1VC.journalEntry.date = dateFormatter.string(from: journalEntryDatePicker.date)
            scene1VC.journalEntry.journalText = journalEntryTextField.text!
        }
    }
    
    @IBAction func pressCancel(_ sender: UIButton) {
        if(journalEntryTextField.text != ""){
            let alert=UIAlertController(title: "Warning", message: "You have something written down. Are you sure you want to cancel?", preferredStyle: UIAlertController.Style.alert)
            //create a UIAlertAction object for the button
            let yesAction=UIAlertAction(title: "Yes", style:UIAlertAction.Style.cancel, handler: {action in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(yesAction) //adds the alert action to the alert object
            let noAction=UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {action in
            })
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
