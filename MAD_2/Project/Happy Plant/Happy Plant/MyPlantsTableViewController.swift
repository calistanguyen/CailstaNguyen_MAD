//
//  MyPlantsTableViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/16/22.
//

import UIKit

class MyPlantsTableViewController: UITableViewController {
    
    let dataHandler = DataHandler();
    var plants = [Plant]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        Task {
            await dataHandler.getFirebaseData()
            plants = dataHandler.getPlants()
            tableView.reloadData()    } }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = plants[indexPath.row].name
        cellConfig.textProperties.font = UIFont(name: "Quicksand-Medium", size: 24)!
        

        cell.contentConfiguration = cellConfig
        
//    https://www.hackingwithswift.com/example-code/uikit/how-to-give-uitableviewcells-a-selected-color-other-than-gray
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 142/255, green: 186/255, blue: 144/255, alpha: 0.46)
        cell.selectedBackgroundView = bgColorView
        
        
        return cell
    }
    
    //MARK: prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetails"{
            if let plantDetailVC = segue.destination as? PlantDetailsViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    plantDetailVC.title = plants[indexPath.row].name
                    plantDetailVC.dateValue = plants[indexPath.row].dayToFertilize
                    plantDetailVC.locationValue = plants[indexPath.row].location
                    plantDetailVC.pickerValue = plants[indexPath.row].waterDay
                    plantDetailVC.plantValue = plants[indexPath.row].name
                }
            }
        }
    }
    
    //MARK: unwind segue
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        if unwindSegue.identifier == "savesegue" {
            let source = unwindSegue.source as! AddPlantViewController
            dataHandler.addPlants(source.addedName, source.addedLocation, source.addedWaterDay, source.addedFertilizeDate)
            getData()
        }
    }

}
