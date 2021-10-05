//
//  journalEntry.swift
//  journal
//
//  Created by Calista Nguyen on 10/5/21.
//

import Foundation

struct JournalEntry {
    var date: String
    var journalText: String
}

extension JournalEntry {
    static var journalEntries: NSMutableArray = [
    JournalEntry(date: "test", journalText: "test"),
        JournalEntry(date:"test", journalText: "test")
    ]
}

