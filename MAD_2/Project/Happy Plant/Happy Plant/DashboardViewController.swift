//
//  DashboardViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/10/22.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var waterCollection: UICollectionView!
    @IBOutlet weak var fertilizeCollection: UICollectionView!
    var plants = [Plant]();
    var dataHandler = DataHandler();
    var wateredPlants =  [Plant]();
    var fertilizedPlants = [Plant]();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerWaterNib()
        registerFertilizeNib()
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 30
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d"
        dateLabel.text = dateFormatter.string(from: date)
    }
    override func viewWillAppear(_ animated: Bool) {
        getData();
    }
    
    //MARK: Get watered and fertilized plants for the day
    func getData(){
        Task {
            await dataHandler.getFirebaseData()
            plants = dataHandler.getPlants()
            setWateredPlants(plants)
            setFertilizedPlants(plants)
            waterCollection.reloadData()
            fertilizeCollection.reloadData()
            print("Plant Recipes \(plants.count)")
    } }
    
    func setWateredPlants(_ plantData:[Plant]) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        wateredPlants = [Plant]()
        for i in plantData {
            if(i.waterDay == dateFormatter.string(from: date)) {
                wateredPlants.append(i);
            }
        }
        
    }
    
    func setFertilizedPlants(_ plantData:[Plant]) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        fertilizedPlants = [Plant]()
        print("DATE TODAY: " + dateFormatter.string(from: date))
        for i in plantData {

            if(i.dayToFertilize == dateFormatter.string(from: date)) {
                fertilizedPlants.append(i);
            }
        }
        
    }
    
    //MARK: Collection View protocalls
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == waterCollection){
            return wateredPlants.count
        }
        return fertilizedPlants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if(collectionView == fertilizeCollection){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fertilize_cell", for: indexPath) as! FertilizeCollectionViewCell
            cell.label.text = fertilizedPlants[indexPath.row].name
            return cell;
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "water_cell", for: indexPath) as! WaterCollectionViewCell
                // Configure the cell
        cell.label.text = wateredPlants[indexPath.row].name
        return cell
    }
    
    
    //MARK: register nibs
    func registerWaterNib() {
        let nib = UINib(nibName: WaterCollectionViewCell.nibName, bundle: nil)
        waterCollection?.register(nib, forCellWithReuseIdentifier: WaterCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.waterCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    func registerFertilizeNib() {
        let nib = UINib(nibName: FertilizeCollectionViewCell.nibName, bundle: nil)
        fertilizeCollection?.register(nib, forCellWithReuseIdentifier: FertilizeCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.fertilizeCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }

}


extension DashboardViewController: UICollectionViewDelegateFlowLayout {
//    https://medium.com/@fhalteh/creating-a-horizontal-uicollectionview-with-dynamic-cell-size-f6ce210f7aa9
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == waterCollection){
            guard let cell: WaterCollectionViewCell = Bundle.main.loadNibNamed(WaterCollectionViewCell.nibName,owner: self,options: nil)?.first as? WaterCollectionViewCell else {
                return CGSize.zero
            }
            cell.label.text = wateredPlants[indexPath.row].name
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return CGSize(width: 150, height: 150)
            
        }
        else {
            guard let cell: FertilizeCollectionViewCell = Bundle.main.loadNibNamed(FertilizeCollectionViewCell.nibName,owner: self,options: nil)?.first as? FertilizeCollectionViewCell else {
                return CGSize.zero
            }
            cell.label.text = fertilizedPlants[indexPath.row].name
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return CGSize(width: 150, height: 150)
            
        }
        
    }
}
