//
//  PokemonTableViewController.swift
//  Pokemon Log
//
//  Created by Calista Nguyen on 2/8/22.
//

import UIKit

class TypesTableViewController: UITableViewController {
    
    var typeList = [String]()
    var pokemonDataLoader = DataLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonDataLoader.loadData(fileName: "pokemon")
        typeList = pokemonDataLoader.getTypes()
        self.tableView.separatorInset = UIEdgeInsets.zero;
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "RobotoMono-Bold", size: 21)!
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont(name: "RobotoMono-Bold", size: 30)!
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewPokemon" {
            if let pokemonVC = segue.destination as? PokemonTableViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    pokemonVC.title = typeList[indexPath.row]
                    pokemonVC.pokemonDataLoader = pokemonDataLoader
                    pokemonVC.typeIdx = indexPath.row
                }
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath)

        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.image = UIImage(named: pokemonDataLoader.getIcon(idx: indexPath.row))
        cellConfig.text = typeList[indexPath.row]
        cellConfig.textProperties.font = UIFont(name: "RobotoMono-Regular", size: 18)!
        cell.contentConfiguration = cellConfig
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
