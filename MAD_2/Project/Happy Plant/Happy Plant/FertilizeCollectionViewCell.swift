//
//  FertilizeCollectionViewCell.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/10/22.
//

import UIKit

class FertilizeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var check_mark: UIImageView!
    
    class var reuseIdentifier: String {
        return "fertilize_cell"
    }
    
    class var nibName: String {
        return "FertilizeCollectionViewCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(tapGestureRecognizer:)))
        check_mark.isUserInteractionEnabled = true
        check_mark.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func buttonTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_mark.image == UIImage(named: "selected") {
            check_mark.image = UIImage(named: "unselected")
        }else {
            check_mark.image = UIImage(named: "selected")
        }
        // Your action
    }

}
