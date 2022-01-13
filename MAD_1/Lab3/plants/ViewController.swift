//
//  ViewController.swift
//  plants
//
//  Created by Calista Nguyen on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantLabel: UILabel!
    
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var capSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changePlant(_ sender: UISegmentedControl) {
        let fontSize = CGFloat(fontSizeSlider.value)
        if sender.selectedSegmentIndex == 0 {
            plantLabel.text = "monstera"
            plantLabel.font = UIFont.italicSystemFont(ofSize: fontSize )
            
            plantImage.image = UIImage(named: "monstera")
        }else {
            plantLabel.text = "pothos"
            plantImage.image = UIImage(named: "pothos")
            plantLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
        }
        
        if capSwitch.isOn{
            plantLabel.text = plantLabel.text?.uppercased()
        } else {
            plantLabel.text = plantLabel.text?.lowercased()
        }
    }
    
    @IBAction func changeCaps(_ sender: UISwitch) {
        if sender.isOn {
            plantLabel.text = plantLabel.text?.uppercased()
        }else {
            plantLabel.text = plantLabel.text?.lowercased()
        }
    }
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize = CGFloat(sender.value)
        plantLabel.font = plantLabel.font.withSize(fontSize)
        
    }
}

