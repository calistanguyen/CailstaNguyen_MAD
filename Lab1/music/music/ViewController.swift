//
//  ViewController.swift
//  music
//
//  Created by Calista Nguyen on 9/7/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayedImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    var artistImages: [UIImage] = [UIImage(named:"glassAnimals")!, UIImage(named:"youngTheGiant")!,UIImage(named: "badSuns")!]
    
    var gaSongsImages: [UIImage] = [UIImage(named:"ga1")!, UIImage(named:"ga2")!]
    var ytgSongsImages: [UIImage] = [UIImage(named:"ytg1")!, UIImage(named:"ytg2")!]
    var bsSongsImages: [UIImage] = [UIImage(named:"bs1")!, UIImage(named:"bs2")!]
    
    var artistIdx: Int = 0
    var songIdx: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recArtist(_ sender: UIButton) {
        if(artistIdx < 2){
            artistIdx += 1
        }else{
            artistIdx = 0
        }
        if(sender.tag == 0){
            displayedImage.image = artistImages[artistIdx]
            if(artistIdx == 0){
                artistLabel.text = "Glass Animals"
            }else if (artistIdx == 1){
                artistLabel.text = "Young The Giant"
            }else {
                artistLabel.text = "Bad Suns"
            }
        }
        songLabel.text = ""
    }
    
    @IBAction func recSongByArtist(_ sender: UIButton) {
        if(songIdx < 1){
            songIdx += 1
        }else{
            songIdx = 0
        }
        
        if(artistIdx == 0){
            displayedImage.image = gaSongsImages[songIdx]
            if(songIdx == 0){
                songLabel.text = "Season 2 Episode 3"
            }else{
                songLabel.text = "Heat Waves"
            }
        }else if (artistIdx == 1){
            displayedImage.image = ytgSongsImages[songIdx]
            if(songIdx == 0){
                songLabel.text = "Mind Over Matter"
            }else{
                songLabel.text = "Apartment"
            }
        }else {
            displayedImage.image = bsSongsImages[songIdx]
            if(songIdx == 0){
                songLabel.text = "Cardiac Arrest"
            }else{
                songLabel.text = "Daft Pretty Boys"
            }
        }
        
    }
}

