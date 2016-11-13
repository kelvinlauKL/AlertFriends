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
  
  weak var delegate: DurationSelectorDelegate?
  
  fileprivate var minutesSelected = 0
  fileprivate var hoursSelected = 0
}

// MARK: - UIPickerControllerDelegate
extension DurationTableViewController: UIPickerViewDataSource {
  fileprivate enum Component: Int {
    case minutes, hours
  }
  
  fileprivate var minutes: [Int] {
    return [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]
  }
  
  fileprivate var hours: [Int] {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    guard let component = Component(rawValue: component) else { fatalError() }
    switch component {
    case .minutes:
      return minutes.count
    case .hours:
      return hours.count
    }
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
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
    }
  }
}

// MARK: - @IBActions
private extension DurationTableViewController {
  @IBAction func doneButtonTapped() {
    let seconds = (minutesSelected * 60) + (hoursSelected * 3600)
    delegate?.durationSelected(seconds: TimeInterval(seconds))
    _ = navigationController?.popViewController(animated: true)
  }
}
