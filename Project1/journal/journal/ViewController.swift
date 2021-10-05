//
//  ViewController.swift
//  journal
//
//  Created by Calista Nguyen on 10/3/21.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        
    }
    
    @IBAction func cancelJournalEntry(_ segue: UIStoryboardSegue){
        //include alert asking if user is sure they don't want to save journal entry if text field is not empty
    }
    

}

