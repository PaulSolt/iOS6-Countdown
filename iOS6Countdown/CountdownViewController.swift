//
//  CountdownViewController.swift
//  iOS6Countdown
//
//  Created by Paul Solt on 5/1/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.countDownDuration = 60
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        print("countdown: \(datePicker.countDownDuration)")
    }
    
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
}
