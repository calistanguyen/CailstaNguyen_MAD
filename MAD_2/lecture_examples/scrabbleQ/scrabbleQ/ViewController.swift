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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.loadData(fileName: wordFile)
        words = data.getWords()
        // Do any additional setup after loading the view.
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

