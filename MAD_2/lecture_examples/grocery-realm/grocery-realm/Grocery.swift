//
//  Grocery.swift
//  grocery-realm
//
//  Created by Calista Nguyen on 3/1/22.
//

import Foundation
import RealmSwift

class Grocery: Object {
    @Persisted(primaryKey: true) var _id = ObjectId.generate()
    @Persisted var name = ""
    @Persisted var bought = false
}
