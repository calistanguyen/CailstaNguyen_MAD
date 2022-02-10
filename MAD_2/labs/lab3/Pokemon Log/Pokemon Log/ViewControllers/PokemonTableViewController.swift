//
//  PokemonTableViewController.swift
//  Pokemon Log
//
//  Created by Calista Nguyen on 2/9/22.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    var pokemonDataLoader = DataLoader()
    var pokemonList = [String]()
    var typeIdx = 0
    var searchController = UISearchController();

    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier == "doneSegue" {
            if let source = segue.source as? AddPokemon {
                if source.addedPokemon.isEmpty == false {
                    pokemonDataLoader.addPokemon(typeIdx: typeIdx, pokemon: source.addedPokemon)
                    pokemonList.append(source.addedPokemon)
                    tableView.reloadData()
                }
            }
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pokemonList = pokemonDataLoader.getPokemon(idx: typeIdx)
        //search results
        let resultsController = SearchTable() //create an instance of our SearchResultsController class
        resultsController.allPokemon = pokemonList //set the allwords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)

        var cellConfig = cell.defaultContentConfiguration();
        cellConfig.text = pokemonList[indexPath.row];
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


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            pokemonList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            pokemonDataLoader.deletePokemon(typeIdx: typeIdx, countryIdx: indexPath.row)
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
