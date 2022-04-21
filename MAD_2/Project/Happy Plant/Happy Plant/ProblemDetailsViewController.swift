//
//  ProblemDetailsViewController.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 4/20/22.
//

import UIKit

class ProblemDetailsViewController: UIViewController {
    
    var imageName: String?
    var about: String?
    var link: String?

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = about!
        image.image = UIImage(named: imageName!)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func openLink(_ sender: Any) {
        
        if let url = URL(string: link!) {
               if #available(iOS 10, *){
                   UIApplication.shared.open(url)
               }else{
                   UIApplication.shared.openURL(url)
               }

           }
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
