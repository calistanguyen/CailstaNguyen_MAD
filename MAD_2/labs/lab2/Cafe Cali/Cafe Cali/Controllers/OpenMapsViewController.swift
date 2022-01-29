//
//  CalculateTipViewController.swift
//  Cafe Cali
//
//  Created by Calista Nguyen on 1/29/22.
//

import UIKit

class OpenMapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func openMaps(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "https://www.google.com/maps")!) {
        UIApplication.shared.open(URL(string: "https://www.google.com/maps")!, options: [:], completionHandler: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "You do not have a browser installed to open google maps", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    
    }

}
