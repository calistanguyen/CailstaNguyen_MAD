//
//  CharacterDetailsViewController.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/26/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController{
    
    var eyeColor = "";
    var hairColor = "";
    var gender = "";
    

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        genderLabel.text = gender;
        eyeColorLabel.text = eyeColor;
        hairColorLabel.text = hairColor;
    }

}
