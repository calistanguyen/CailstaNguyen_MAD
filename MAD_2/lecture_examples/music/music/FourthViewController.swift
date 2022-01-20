//
//  FourthViewController.swift
//  music
//
//  Created by Calista Nguyen on 1/20/22.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func goToMusic(_ sender: UIButton) {
        
        if(UIApplication.shared.canOpenURL(URL(string: "spotify://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "spotify://")!, options: [:], completionHandler: nil)
        } else {
            if(UIApplication.shared.canOpenURL(URL(string: "music://")!)){
                //open the app with this URL scheme
                UIApplication.shared.open(URL(string: "music://")!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(URL(string: "http://www.apple.com/music/")!, options: [:], completionHandler: nil)
            }
        }
    
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
