//
//  ViewJournalEntryViewController.swift
//  journal
//
//  Created by Calista Nguyen on 10/7/21.
//

import UIKit

class ViewJournalEntryViewController: UIViewController {

    @IBOutlet weak var displayedDate: UILabel!
    @IBOutlet weak var displayedJournalText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var displayedJournalEntry = JournalEntry(date: "", journalText: "")
    
}
