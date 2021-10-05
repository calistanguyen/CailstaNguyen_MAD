//
//  CreateJournalEntry.swift
//  journal
//
//  Created by Calista Nguyen on 10/4/21.
//

import UIKit

class CreateJournalEntry: UIViewController {

    @IBOutlet weak var journalEntryTextField: UITextField!
    @IBOutlet weak var journalEntryDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func alertCancel(_ sender: UIButton) {
        //if journal entry text field is not empty, alert user asking if they want to cancel
    }
}
