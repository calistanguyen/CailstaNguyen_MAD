//
//  JournalEntry.swift
//  tableview
//
//  Created by Calista Nguyen on 9/27/21.
//

import Foundation

struct JournalEntry {
    var date: String
    var journalEntry: String
}

extension JournalEntry {
    static var testData = [
        JournalEntry(date: "September 20, 2021", journalEntry: "Today was a good day"),
        JournalEntry(date: "September 21, 2021", journalEntry: "I had yummy coffee today"),
        JournalEntry(date: "September 22, 2021", journalEntry: "My pet cat bit me :("),
    ]
}
