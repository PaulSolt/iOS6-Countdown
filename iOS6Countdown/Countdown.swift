//
//  Countdown.swift
//  iOS6Countdown
//
//  Created by Paul Solt on 5/1/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class Countdown {
    
    // Mark time started
    // Timer: Continually check if we've reached the length of time
    // Delegate: Let us know when that happens
    // Functions:
    // Start
    // Stop
    // Reset
    
    init(duration: TimeInterval = 60) {
        self.duration = duration
        self.timeRemaining = duration
    }
    
    func start(duration: TimeInterval) {
        self.duration = duration
        self.timeRemaining = duration
        
        stopDate = Date(timeIntervalSinceNow: duration)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
    }
    
    func stop() {
        stopDate = nil
    }
    
    func reset() {
        stopDate = nil
    }
    
    @objc func update(timer: Timer) {
        
        // Calculate time remaining
        // stopDate - currentTime = timeRemaining
        if let stopDate = stopDate {
            let currentTime = Date()
            timeRemaining = stopDate.timeIntervalSince(currentTime)
            print("Time Remaining: \(timeRemaining)")
        }
    }
    
    var timer: Timer?
    var startDate: Date?
    var stopDate: Date?
    var timeRemaining: TimeInterval  // 3.5 number of seconds (Double)
    var duration: TimeInterval
    // TODO: delegate
    
    // 3.5 seconds = 00:00:03.50
    // 0.03 seconds = 00:00:00.03
    
}
