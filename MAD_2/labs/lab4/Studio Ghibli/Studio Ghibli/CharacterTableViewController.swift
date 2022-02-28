//
//  CharacterTableViewController.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/26/22.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    var characters = [Character]();
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterDetailSegue"{
            if let characterDetailVC = segue.destination as? CharacterDetailsViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    characterDetailVC.title = characters[indexPath.row].name
                    characterDetailVC.eyeColor = characters[indexPath.row].eye_color
                    characterDetailVC.hairColor = characters[indexPath.row].hair_color
                    characterDetailVC.gender = characters[indexPath.row].gender
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = characters[indexPath.row].name
        cell.contentConfiguration = cellConfig
        return cell
    }

}
