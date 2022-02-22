//
//  ViewController.swift
//  jokes
//
//  Created by Calista Nguyen on 2/15/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var jokeTableView: UITableView!
    var jokes = [Joke]()
    var jokeDataHandler = JokeDataHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadTestData();
        getAPIData()
    }
    
    func getAPIData() {
        Task {
            await jokeDataHandler.loadjson()
            jokes = jokeDataHandler.getJokes()
            jokeTableView.reloadData()
            print("Number of jokes \(jokes.count)")
        }
    }
    
    func loadTestData() {
        //test data
        let joke1 = Joke(setup: "setup 1", delivery: "delivery 1")
        let joke2 = Joke(setup: "setup 2", delivery: "delivery 2")
        let joke3 = Joke(setup: "setup 3", delivery: "delivery 3")
        jokes.append(joke1)
        jokes.append(joke2)
        jokes.append(joke3)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableview cell for row at")
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = jokes[indexPath.row].setup
        cell.contentConfiguration = cellConfig
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: jokes[indexPath.row].setup, message: jokes[indexPath.row].delivery, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Haha", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been choosen
    }


}

