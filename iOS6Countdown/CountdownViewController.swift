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
        countdown.delegate = self
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        // get duration?
        let duration = datePicker.countDownDuration
        countdown.start(duration: duration)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        print("countdown: \(datePicker.countDownDuration)")
    }
    
    private func updateViews() {
//        timeLabel.text = "\(countdown.timeRemaining)"
        let date = Date(timeIntervalSinceReferenceDate: countdown.timeRemaining)
        timeLabel.text = dateFormatter.string(from: date)
    }
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    let countdown = Countdown()

    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        // customize it to show 00:00:00.00
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }()
}

extension CountdownViewController: CountdownDelegate {
    func countdownDidFinish() {
        updateViews()
        print("FINISHED")
    }
    
    func countdownDidUpdate(timeRemaining: TimeInterval) {
        // update the views
        updateViews()
    }
}
