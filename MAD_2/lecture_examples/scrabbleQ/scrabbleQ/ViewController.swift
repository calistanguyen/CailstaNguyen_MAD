//
//  ViewController.swift
//  scrabbleQ
//
//  Created by Calista Nguyen on 1/27/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var words = [String]()
    var data = DataLoader()
    let wordFile = "qwordswithoutu1"
    
    var searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.loadData(fileName: wordFile)
        words = data.getWords()
        // Do any additional setup after loading the view.
        
        //search results
        //search results
        let resultsController = SearchResultsViewController() //create an instance of our SearchResultsController class
        resultsController.allWords = words //set the allwords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scrabbleCell", for: indexPath)
        
        //content configuration
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = words[indexPath.row]
        cellConfig.image = UIImage(named: "scrabble_q30")
        cellConfig.secondaryText = "Q no U"
        cell.contentConfiguration = cellConfig
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Row selected", message: "You selected \(words[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been choosen
    }

}

