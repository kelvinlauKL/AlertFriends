//
//  GroupsTableViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-13.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol GroupSelectorDelegate: class {
  func didSelectGroup(group: Group)
}

final class GroupTableViewController: UITableViewController {
  weak var delegate: GroupSelectorDelegate?
  fileprivate var groups: [Group] = []
}

// MARK: - Life Cycle
extension GroupTableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Server.fetchGroups { groups in
      self.groups.append(contentsOf: groups)
      self.tableView.reloadData()
    }
  }
}

// MARK: - UITableViewDataSource
extension GroupTableViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier) as? GroupCell else { fatalError() }
    cell.group = groups[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return groups.count
  }
}

// MARK: - UITableViewDelegate
extension GroupTableViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    delegate?.didSelectGroup(group: groups[indexPath.row])
    _ = navigationController?.popViewController(animated: true)
  }
}
// MARK: - @IBActions 
private extension GroupTableViewController {
  @IBAction func addButtonTapped() {
    
  }
}
