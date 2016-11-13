//
//  EventDetailsTableViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-13.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class EventDetailsTableViewController: UITableViewController {
  @IBOutlet fileprivate var imageView: UIImageView! {
    didSet {
      imageView.layer.cornerRadius = imageView.frame.height / 2
      
    }
  }
  @IBOutlet fileprivate var nameTextField: UITextField!
  @IBOutlet fileprivate var threatView: UIView!
  @IBOutlet fileprivate var threatLabel: UILabel!
  @IBOutlet fileprivate var durationLabel: UILabel!
  @IBOutlet fileprivate var targetLabel: UILabel!
  
  var event: Event!
}

// MARK: - SegueHandlerType
extension EventDetailsTableViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case startTimer
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .startTimer:
      let timerVC = segue.destination as! TimerViewController
      timerVC.event = event
    }
  }
}

// MARK: - Life Cycle
extension EventDetailsTableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.text = event.name
    threatLabel.text = event.threatLevel.description
    durationLabel.text = event.durationDescription
    targetLabel.text = event.targetGroup.name
    imageView.image = event.image
    threatView.backgroundColor = event.threatLevel.color
  }
}
// MARK: - UITableViewDelegate
extension EventDetailsTableViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    if indexPath.section == 1 && indexPath.row == 0 {
      performSegue(withIdentifier: .startTimer, sender: nil)
    }
  }
}
