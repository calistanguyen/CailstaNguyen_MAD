//
//  SpeciesTableViewController.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/25/22.
//

import UIKit

class SpeciesTableViewController: UITableViewController {
    
    let species = ["Human", "Cat", "Totoro", "Dragon"]
    let speciesIcons = ["human_icon", "cat_icon", "other_icon", "dragon_icon"]
    let speciesData = SpeciesDataHandler();
    let characterData = CharacterDataHandler();

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "JosefinSans-Bold", size: 21)!
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont(name: "JosefinSans-Bold", size: 30)!
        ]
        getSpeciesData()
        
        
        
    }
    
    func getSpeciesData() {
        Task {
            for i in species {
                await speciesData.loadjson(speciesName: i);
            }
            getCharacterData()
        }
        tableView.reloadData();
    }
    
    func getCharacterData() {
        Task{
            for i in species {
                characterData.characters[i] = [Character]()
                for j in speciesData.getSpeciesByType(i) {
                    await characterData.loadjson(characterURL: j, speciesName: i)
                }
            }
            tableView.reloadData();
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewAllCharactersSegue"{
            if let characterVC = segue.destination as? CharacterTableViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    characterVC.characters = characterData.characters[species[indexPath.row]]!
                    characterVC.title = species[indexPath.row]
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return species.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "speciesCell", for: indexPath)

        var cellConfig = cell.defaultContentConfiguration();
        cellConfig.text = species[indexPath.row];
        cellConfig.textProperties.font = UIFont(name: "JosefinSans-Light", size: 18)!
        cellConfig.image = UIImage(named: speciesIcons[indexPath.row]);
        cell.contentConfiguration = cellConfig;
        return cell
    }
}
