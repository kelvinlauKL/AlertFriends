//
//  DurationTableViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol DurationSelectorDelegate: class {
  func durationSelected(seconds: TimeInterval)
}

final class DurationTableViewController: UITableViewController {
  @IBOutlet fileprivate var hoursLabel: UILabel!
  @IBOutlet fileprivate var minutesLabel: UILabel!
  @IBOutlet fileprivate var secondsLabel: UILabel!
  
  weak var delegate: DurationSelectorDelegate?
  
  fileprivate var minutesSelected = 0
  fileprivate var hoursSelected = 0
  fileprivate var secondsSelected = 0
}

// MARK: - Life Cycle
extension DurationTableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    hoursLabel.text = "0h"
    minutesLabel.text = "0m"
    secondsLabel.text = "0s"
  }
}
// MARK: - UIPickerControllerDelegate
extension DurationTableViewController: UIPickerViewDataSource {
  fileprivate enum Component: Int {
    case hours, minutes, seconds
  }
  
  fileprivate var minutes: [Int] {
    return [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]
  }
  
  fileprivate var hours: [Int] {
    return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
  }
  
  fileprivate var seconds: [Int] {
    return (0...60).map { $0 }
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    guard let component = Component(rawValue: component) else { fatalError() }
    switch component {
    case .minutes:
      return minutes.count
    case .hours:
      return hours.count
    case .seconds:
      return seconds.count
    }
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3
  }
}

// MARK: - UIPickerControllerDelegate 
extension DurationTableViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    guard let component = Component(rawValue: component) else { fatalError() }
    switch component {
    case .minutes:
      return "\(minutes[row])"
    case .hours:
      return "\(hours[row])"
    case .seconds:
      return "\(seconds[row])"
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    guard let component = Component(rawValue: component) else { fatalError() }
    switch component {
    case .minutes:
      minutesLabel.text = "\(minutes[row])m"
      minutesSelected = minutes[row]
    case .hours:
      hoursLabel.text = "\(hours[row])h"
      hoursSelected = hours[row]
    case .seconds:
      secondsLabel.text = "\(seconds[row])s"
      secondsSelected = seconds[row]
    }
  }
}

// MARK: - @IBActions
private extension DurationTableViewController {
  @IBAction func doneButtonTapped() {
    let seconds = (minutesSelected * 60) + (hoursSelected * 3600) + secondsSelected
    delegate?.durationSelected(seconds: TimeInterval(seconds))
    _ = navigationController?.popViewController(animated: true)
  }
}
