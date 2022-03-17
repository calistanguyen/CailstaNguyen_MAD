//
//  CollectionViewCell.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/10/22.
//

import UIKit

class WaterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var waterButton: UIImageView!
        
    
    class var reuseIdentifier: String {
        return "water_cell"
    }
    
    class var nibName: String {
        return "WaterCollectionViewCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(tapGestureRecognizer:)))
        waterButton.isUserInteractionEnabled = true
        waterButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func buttonTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if waterButton.image == UIImage(named: "water_empty") {
            waterButton.image = UIImage(named: "water_filled")
        }else {
            waterButton.image = UIImage(named: "water_empty")
        }
        // Your action
    }

}
