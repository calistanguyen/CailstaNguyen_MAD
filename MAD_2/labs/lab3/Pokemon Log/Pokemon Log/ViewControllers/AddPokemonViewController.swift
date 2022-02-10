//
//  AddCountryViewController.swift
//  Pokemon Log
//
//  Created by Calista Nguyen on 2/9/22.
//

import UIKit

class AddPokemon: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var addedPokemon = String();
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "doneSegue"{
                //only add a country if there is text in the textfield
    if textField.text?.isEmpty == false{ addedPokemon=textField.text!} }
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
