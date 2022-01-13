//
//  ViewController.swift
//  journal
//
//  Created by Calista Nguyen on 10/3/21.
//

import UIKit

class JournalEntryListViewController: UITableViewController {
    @IBOutlet var journalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var journalEntry = JournalEntry(date: "", journalText: "")
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        if segue.identifier == "submit"{
            JournalEntry.journalEntries.insert(journalEntry, at: 0)
            tableView.reloadData()
        }
    }
    

}

extension JournalEntryListViewController {
    static let journalEntryListCellIdentifier = "journalCell"
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalEntry.journalEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.journalEntryListCellIdentifier, for: indexPath) as? JournalEntryCell else {
            fatalError("Unable to dequeue JournalEntryCell")
        }
        
        let journalEntry: JournalEntry = JournalEntry.journalEntries[indexPath.row] as! JournalEntry
        cell.date.text = journalEntry.date
        cell.journalText.text = journalEntry.journalText
        return cell

    }

}

