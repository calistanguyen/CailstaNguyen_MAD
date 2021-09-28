//
//  ViewController.swift
//  tableview
//
//  Created by Calista Nguyen on 9/27/21.
//

import UIKit

class JournalListViewController: UITableViewController {

    
}

extension JournalListViewController {
    static let journalEntryListCellIdentifier = "JournalEntryCell"
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalEntry.testData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.journalEntryListCellIdentifier, for: indexPath) as? JournalListCell else {
            fatalError("Unable to dequeue JournalEntryCell")
        }
        
        let journalEntry = JournalEntry.testData[indexPath.row]
        cell.date.text = journalEntry.date
        cell.journalEntry.text = journalEntry.journalEntry
        return cell

    }

}

