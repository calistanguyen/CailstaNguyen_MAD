//
//  GroceryDataHandler.swift
//  grocery-realm
//
//  Created by Calista Nguyen on 3/1/22.
//

import Foundation
import RealmSwift

class GroceryDataHandler {
    var myRealm: Realm!
    var groceryData: Results<Grocery>
    {
        get{
            return myRealm.objects(Grocery.self)
        }
    }
    func dbSetup() {
        do {
            myRealm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
    
    
    func addItem(newItem: Grocery) {
        do {
            try myRealm.write({myRealm.add(newItem)})
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func boughtItem(item: Grocery) {
        do {
            try myRealm.write({
                item.bought = !item.bought
            })
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteItem(item: Grocery) {
        do {
            try myRealm.write({
                myRealm.delete(item)
            })
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getGroceries() -> [Grocery] {
        return Array(groceryData)
    }
    
    
}
