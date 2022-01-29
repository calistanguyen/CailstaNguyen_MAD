//
//  OrderViewController.swift
//  Cafe Cali
//
//  Created by Calista Nguyen on 1/29/22.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onDateChanged(_ sender: Any) {
//    https://stackoverflow.com/questions/33449137/get-date-from-date-picker-in-swift
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy h:mm a"
        let dateString = formatter.string(from: datePicker.date)
        dateLabel.text = "Your order is ready for pick up on \(dateString)"
    }
}
