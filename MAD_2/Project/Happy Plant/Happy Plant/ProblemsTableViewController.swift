//
//  ProblemsTableViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 4/20/22.
//

import UIKit

class ProblemsTableViewController: UITableViewController {
    
    let problems = [["Mealy Bugs", "Spider Mites",], ["Wilting Leaves", "Yellow Leaves"]]
    
    let descriptions = [
       [ "Pests that feed on plant juices of greenhouse plants, house plants and subtropical trees and also act as a vector for several plant diseases.",
        "Spider mites generally live on the undersides of leaves of plants, where they may spin protective silk webs, and they can cause damage by puncturing the plant cells to feed.",],
      [  "When a plant is wilting, it is typically due to under watering, overwatering, or too much direct sunlight.",
         "Water issues — either too much or too little — are the leading reason behind yellow leaves. In overly wet soil, roots can't breathe. They suffocate, shut down and stop delivering the water and nutrients plants need. Underwatering, or drought, has a similar effect."
      ]
    ]
    
    let images = [["mealybug", "spidermites"], ["wiltingleaves", "yellowleaves"]]
    
    let links = [
        ["https://mycityplants.com/blogs/plant-journal/how-to-get-rid-of-mealybugs",
        "https://mycityplants.com/blogs/plant-journal/how-to-get-rid-of-spider-mites#:~:text=Use%20mixture%20of%20alcohol%20and,off%20with%20the%20paper%20towel."],
        ["https://thepracticalplanter.com/how-to-fix-drooping-plants/",
        "https://www.bobvila.com/articles/yellow-leaves/"]
    ]
    
    let headers = ["Pests", "Symptoms"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headers.count {
                return headers[section]
            }
            return nil
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return problems.count
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return problems[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "problemCell", for: indexPath)

        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = problems[indexPath.section][indexPath.row]
        cellConfig.textProperties.font = UIFont(name: "Quicksand-Medium", size: 24)!
        
        cell.contentConfiguration = cellConfig

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewProblemDetails"{
            if let problemDetailVC = segue.destination as? ProblemDetailsViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    problemDetailVC.imageName = images[indexPath.section][indexPath.row]
                    problemDetailVC.about = descriptions[indexPath.section][indexPath.row]
                    problemDetailVC.link = links[indexPath.section][indexPath.row]
                    problemDetailVC.title = problems[indexPath.section][indexPath.row]
                }
            }
        }
    }

}
