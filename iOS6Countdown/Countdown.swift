//
//  Countdown.swift
//  iOS6Countdown
//
//  Created by Paul Solt on 5/1/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

protocol CountdownDelegate: AnyObject {
    func countdownDidUpdate(timeRemaining: TimeInterval)
    func countdownDidFinish()
}

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
        
        // Projected date into the future
        stopDate = Date(timeIntervalSinceNow: duration)
        
        // Start a timer to update continuously
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
    }
    
    func stop() {
        // TODO: Finish logic
        stopDate = nil
    }
    
    func reset() {
        // TODO: Finish logic + connect to UI
        stopDate = nil
        timeRemaining = 0
    }
    
    @objc func update(timer: Timer) {
        
        // Calculate time remaining
        // stopDate - currentTime = timeRemaining
        if let stopDate = stopDate {
            
            let currentTime = Date()
            
            if currentTime <= stopDate {
                // Timer is active, keep counting
                
                timeRemaining = stopDate.timeIntervalSince(currentTime)
                print("Time Remaining: \(timeRemaining)")
                delegate?.countdownDidUpdate(timeRemaining: timeRemaining)
                
            } else {
                // currentTime > stopDate
                clearTimer()
                reset()
                delegate?.countdownDidFinish()
            }
        }
    }
    
    private func clearTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    var timer: Timer?
    var startDate: Date?
    var stopDate: Date?
    var timeRemaining: TimeInterval  // 3.5 number of seconds (Double)
    var duration: TimeInterval
    weak var delegate: CountdownDelegate?
    
    // 3.5 seconds = 00:00:03.50
    // 0.03 seconds = 00:00:00.03
}
