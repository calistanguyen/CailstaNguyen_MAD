//
//  MyPlantsTableViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/16/22.
//

import UIKit

class MyPlantsTableViewController: UITableViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return testPlantData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = testPlantData[indexPath.row].name
        cellConfig.secondaryText = testPlantData[indexPath.row].plantType
        cellConfig.textProperties.font = UIFont(name: "Quicksand-Medium", size: 24)!
        cellConfig.secondaryTextProperties.font = UIFont(name: "Quicksand-regular", size: 14)!
        

        cell.contentConfiguration = cellConfig
        
//    https://www.hackingwithswift.com/example-code/uikit/how-to-give-uitableviewcells-a-selected-color-other-than-gray
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 142/255, green: 186/255, blue: 144/255, alpha: 0.46)
        cell.selectedBackgroundView = bgColorView
        
        
        return cell
    }

}
