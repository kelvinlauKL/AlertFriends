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
  @IBOutlet fileprivate var threatLabel: UILabel! {
    didSet {
      threatLabel.isHidden = true
    }
  }
  @IBOutlet fileprivate var durationLabel: UILabel! {
    didSet {
      durationLabel.isHidden = true
    }
  }
  
  @IBOutlet fileprivate var threatIndicatorView: UIView!
  @IBOutlet fileprivate var groupLabel: UILabel! {
    didSet {
      groupLabel.isHidden = true
    }
  }
  
  weak var delegate: CreateEventDelegate?
  
  fileprivate var duration: TimeInterval? {
    didSet {
      if let duration = duration {
        durationLabel.isHidden = false
        
        let seconds = Int(duration)
        let minutes = seconds / 60
        
        let leftoverMinutes = minutes % 60
        let hours = minutes / 60
        
        durationLabel.text = "\(hours)h \(leftoverMinutes)m"
      }
    }
  }
  
  fileprivate var threatLevel: Event.ThreatLevel? {
    didSet {
      if let threatLevel = threatLevel {
        threatLabel.isHidden = false
        threatIndicatorView.backgroundColor = threatLevel.color
        threatLabel.text = threatLevel.description
      }
    }
  }
  
  fileprivate var group: Group? {
    didSet {
      if let group = group {
        groupLabel.text = group.name
        groupLabel.isHidden = false
      }
    }
  }
  
  fileprivate var categories = Category.allValues
  fileprivate var isSelected = Category.allValues.map { _ -> Bool in
    return false
  }
}

// MARK: - SegueHandlerType
extension CreateEventViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case durationSelector, threatSelector, groupSelector
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .durationSelector:
      let durationVC = segue.destination as! DurationTableViewController
      durationVC.delegate = self
    case .threatSelector:
      let threatVC = segue.destination as! ThreatTableViewController
      threatVC.delegate = self
    case .groupSelector:
      let groupVC = segue.destination as! GroupTableViewController
      groupVC.delegate = self
    }
  }
}

// MARK: - UICollectionViewDataSource
extension CreateEventViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { fatalError() }
    cell.category = categories[indexPath.item]
    cell.removeFilter(isSelected[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
}

// MARK: - UICollectionViewDelegate
extension CreateEventViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    
    let selectedIndex = indexPath.item
    
    for (index, _) in isSelected.enumerated() {
      if index == selectedIndex {
        isSelected[index] = true
      } else {
        isSelected[index] = false
      }
    }
    
    collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CreateEventViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    let insets = layout.sectionInset.top + layout.sectionInset.bottom
    
    let height = collectionView.frame.height - insets
    return CGSize(width: height, height: height)
  }
}

// MARK: - UITableViewDelegate 
extension CreateEventViewController {
  fileprivate enum Row: Int {
    case name, threatLevel, duration, targetGroup
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
    case .targetGroup:
      performSegue(withIdentifier: .groupSelector, sender: nil)
    }
  }
}

// MARK: - DurationSelectorDelegate
extension CreateEventViewController: DurationSelectorDelegate {
  func durationSelected(seconds: TimeInterval) {
    duration = seconds
  }
}

// MARK: - ThreatSelectorDelegate
extension CreateEventViewController: ThreatSelectorDelegate {
  func threatSelected(threat: Event.ThreatLevel) {
    threatLevel = threat
  }
}

// MARK: - GroupSelectorDelegate
extension CreateEventViewController: GroupSelectorDelegate {
  func didSelectGroup(group: Group) {
    self.group = group
  }
}

// MARK: - @IBActions
private extension CreateEventViewController {
  @IBAction func doneButtonTapped() {
    guard let threatLevel = threatLevel, let duration = duration, let name = eventName.text, let group = group, !name.isEmpty else {
      displayAlert(withMessage: "Missing Fields.")
      return
    }
    
    var image = #imageLiteral(resourceName: "profilePlaceholder")
    for (index, value) in isSelected.enumerated() {
      if value {
        image = categories[index].image
      }
    }
    
    
    let event = Event(name: name, image: image, threatLevel: threatLevel, duration: duration, targetGroup: group)
    
    delegate?.eventCreated(event: event)
    _ = navigationController?.popViewController(animated: true)
  }
}
