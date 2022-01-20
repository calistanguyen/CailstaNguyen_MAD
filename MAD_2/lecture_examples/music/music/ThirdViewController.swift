//
//  ThirdViewController.swift
//  music
//
//  Created by Calista Nguyen on 1/20/22.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var artistPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    var artists = [String]()
    var albums = [String]()
    var musicData = DataLoader()
    let filename = "artistalbums2"
    
    let artistComponent = 0
    let albumComponent = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicData.loadData(filename: filename)
        artists = musicData.getArtists()
        //index 0 because the first item in the picker is always at index 0
        albums = musicData.getAlbums(index: 0)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2; 
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == artistComponent {
            return artists.count
        } else {
            return albums.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == artistComponent {
            return artists[row]
        } else {
            return albums[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == artistComponent {
            albums = musicData.getAlbums(index: row) //gets the albums for the selected artist
            artistPicker.reloadComponent(albumComponent) //reloads the album component
            artistPicker.selectRow(0, inComponent: albumComponent, animated: true) //set the album component back to 0
        }
        
        let artistrow = pickerView.selectedRow(inComponent: artistComponent)
        let albumrow = pickerView.selectedRow(inComponent: albumComponent)
        
        choiceLabel.text = "You like \(albums[albumrow]) by \(artists[artistrow])"
    }
    
    

}
