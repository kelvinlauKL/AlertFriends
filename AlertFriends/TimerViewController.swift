//
//  TimerViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-13.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class TimerViewController: UIViewController {
  @IBOutlet fileprivate var timerLabel: UILabel!
  
  var event: Event!
  var duration: TimeInterval = 0
  
  var timer: Timer!
}

// MARK: - Life Cycle 
extension TimerViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    duration = event.duration
    updateTime()
    
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
  }
}

// MARK: - Helper Methods
extension TimerViewController {
  func updateTime() {
    let hours = Int(duration) / 3600
    let minutes = (Int(duration) / 60) % 60
    let seconds = Int(duration) % 60
    
    var timerString = ""
    
    if hours < 10 {
      timerString += "0\(hours):"
    } else {
      timerString += "\(hours):"
    }
    
    if minutes < 10 {
      timerString += "0\(minutes):"
    } else {
      timerString += "\(minutes):"
    }
    
    if seconds < 10 {
      timerString += "0\(seconds)"
    } else {
      timerString += "\(seconds)"
    }
    timerLabel.text = timerString
    
    if duration <= 0 {
      let alertController = UIAlertController(title: nil, message: "Contacts have been notified that you haven't checked in.", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
        self.dismiss(animated: true, completion: nil)
      })
      
      timer.invalidate()
      timer = nil
      alertController.addAction(alertAction)
      present(alertController, animated: true, completion: nil)
      
    }
    duration -= 1
  }
}
// MARK: - @IBActions
private extension TimerViewController {
  @IBAction func cancelTimerTapped() {
    let alertController = UIAlertController(title: nil, message: "Congrats for making it back alive!", preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
      self.dismiss(animated: true, completion: nil)
    })
    
    timer.invalidate()
    timer = nil
    alertController.addAction(alertAction)
    present(alertController, animated: true, completion: nil)
  }
}
