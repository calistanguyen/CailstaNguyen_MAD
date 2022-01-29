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
        UIApplication.shared.open(URL(string: "https://www.google.com/maps")!, options: [:], completionHandler: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
