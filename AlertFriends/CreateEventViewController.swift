//
//  CreateEventViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol CreateEventDelegate: class {
  func eventCreated(event: Event)
}

final class CreateEventViewController: UITableViewController {
  @IBOutlet fileprivate var eventName: UITextField!
  
  weak var delegate: CreateEventDelegate?
  
  fileprivate var duration: TimeInterval?
  fileprivate var threatLevel: Event.ThreatLevel?
}

// MARK: - SegueHandlerType
extension CreateEventViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case durationSelector, threatSelector
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .durationSelector:
      let durationVC = segue.destination as! DurationTableViewController
      durationVC.delegate = self
    case .threatSelector:
      break
    }
  }
}

// MARK: - UITableViewDelegate 
extension CreateEventViewController {
  fileprivate enum Row: Int {
    case name, threatLevel, duration
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let row = Row(rawValue: indexPath.row) else { fatalError() }
    switch row {
    case .name:
      eventName.becomeFirstResponder()
    case .threatLevel:
      performSegue(withIdentifier: .threatSelector, sender: nil)
    case .duration:
      performSegue(withIdentifier: .durationSelector, sender: nil)
    }
  }
}

// MARK: - DurationSelectorDelegate
extension CreateEventViewController: DurationSelectorDelegate {
  func durationSelected(seconds: TimeInterval) {
    
  }
}

// MARK: - @IBActions
private extension CreateEventViewController {
  @IBAction func doneButtonTapped() {
    guard let threatLevel = threatLevel, let duration = duration, let name = eventName.text, !name.isEmpty else {
      displayAlert(withMessage: "Missing Fields.")
      return
    }
    
    let event = Event(name: name, image: #imageLiteral(resourceName: "groceryShopping"), threatLevel: threatLevel, duration: duration)
    
    delegate?.eventCreated(event: event)
    _ = navigationController?.popViewController(animated: true)
  }
}
