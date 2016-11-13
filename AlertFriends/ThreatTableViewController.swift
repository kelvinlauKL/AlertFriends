//
//  ThreatTableViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol ThreatSelectorDelegate: class {
  func threatSelected(threat: Event.ThreatLevel)
}

final class ThreatTableViewController: UITableViewController {
  weak var delegate: ThreatSelectorDelegate?
}

// MARK: - UITableViewDelegate
extension ThreatTableViewController {
  fileprivate enum Row: Int {
    case high, medium, low
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let row = Row(rawValue: indexPath.row) else { fatalError() }
    delegate?.threatSelected(threat: {
      switch row {
      case .high:
        return .high
      case .medium:
        return .medium
      case .low:
        return .low
      }
    }())
    _ = navigationController?.popViewController(animated: true)
  }
}
