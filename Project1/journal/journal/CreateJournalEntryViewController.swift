//
//  CreateJournalEntry.swift
//  journal
//
//  Created by Calista Nguyen on 10/4/21.
//

import UIKit
import Foundation

class CreateJournalEntryViewController: UIViewController {

    @IBOutlet weak var journalEntryTextField: UITextField!
    @IBOutlet weak var journalEntryDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func alertCancel(_ sender: UIButton) {
        //if journal entry text field is not empty, alert user asking if they want to cancel
    }
}
