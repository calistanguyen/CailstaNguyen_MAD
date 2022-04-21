//
//  PlantDetailsViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/16/22.
//

import UIKit

class PlantDetailsViewController: UIViewController{

    var plant: Plant?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var waterDay: UILabel!
    @IBOutlet weak var fertilizeDate: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        name.text = plant?.name
        location.text = plant?.location
        type.text = plant?.type
        waterDay.text = plant?.waterDay
        fertilizeDate.text = plant?.dayToFertilize
        self.title = plant?.name
    }
    
    func updatePlant(newPlant: Plant) {
        plant = newPlant
        print("UPDATING DATA \(newPlant.name)")
        name.text = plant?.name
        location.text = plant?.location
        type.text = plant?.type
        waterDay.text = plant?.waterDay
        fertilizeDate.text = plant?.dayToFertilize
        self.title = plant?.name
    }
    
    //MARK: prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //https://stackoverflow.com/questions/19343519/pass-data-back-to-previous-viewcontroller
        if segue.identifier == "editPlant"{
            if let editPlantVC = segue.destination as? EditPlantViewController {
                editPlantVC.currentPlant = plant
                editPlantVC.callback = { newPlant in
                    
                    self.updatePlant(newPlant: newPlant)
                            
                    }
            }
        }
    }
    
    //MARK: unwind segue
    @IBAction func unwind(unwindSegue: UIStoryboardSegue){
    }

}
