//
//  TableViewController.swift
//  Homework
//
//  Created by Calista Nguyen on 3/31/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    let dataHandler = DataHandler()
    var homeworkList = [Homework]()
    let fileName = "homework"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataHandler.loadData(filename: fileName)
        homeworkList = dataHandler.getHomeworkList()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func applicationWillResignActive(_ notification: Notification){
        dataHandler.saveData(fileName: fileName)
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkList.count
    }

    @IBAction func addHomework(_ sender: Any) {
        let addalert = UIAlertController(title: "New Item", message: "Add a new homework assignment to your list", preferredStyle: .alert)
        addalert.addTextField(configurationHandler: {(UITextField) in
            UITextField.placeholder = "Class"
        })
        addalert.addTextField(configurationHandler: {(UITextField) in
            UITextField.placeholder = "Name"
        })
        addalert.addTextField(configurationHandler: {(UITextField) in
            UITextField.placeholder = "Due Date"
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addItemAction = UIAlertAction(title: "Add", style: .default, handler: { UIAction in
            if(addalert.textFields![0].text != "" && addalert.textFields![1].text != "" && addalert.textFields![2].text != "" ){
                print("I AM HERE")
                print(addalert.textFields![0].text!)
                let name = addalert.textFields![1].text!
                let assignedClass = addalert.textFields![0].text!
                let dueDate = addalert.textFields![2].text!
                self.homeworkList.append(Homework(name: name, assignedClass: assignedClass, dueDate: dueDate))
                self.dataHandler.addItem(newItem: Homework(name: name, assignedClass: assignedClass, dueDate: dueDate) )
                self.tableView.reloadData();
            }
        })
        addalert.addAction(addItemAction)
        addalert.addAction(cancelAction)
        
        present(addalert, animated: true, completion: nil)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let hw = homeworkList[indexPath.row]
        var cellConfig = cell.defaultContentConfiguration();
        cellConfig.text = "\(hw.assignedClass): \(hw.name)"
        cellConfig.secondaryText = "Due \(hw.dueDate)"
        cell.contentConfiguration = cellConfig
        return cell
    }



    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataHandler.deleteItem(index: indexPath.row)
            homeworkList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
