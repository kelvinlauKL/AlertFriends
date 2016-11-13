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
