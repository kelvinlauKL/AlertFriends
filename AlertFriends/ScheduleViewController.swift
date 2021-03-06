//
//  ScheduleViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class ScheduleViewController: UIViewController {
  @IBOutlet fileprivate var collectionView: UICollectionView! 
  
  fileprivate var events: [Event] = []
}

// MARK: - SegueHandlerType
extension ScheduleViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case createEvent, eventDetails
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .createEvent:
      let createVC = segue.destination as! CreateEventViewController
      createVC.delegate = self
    case .eventDetails:
      guard let eventIndex = sender as? Int else { fatalError() }
      let detailVC = segue.destination as! EventDetailsTableViewController
      detailVC.event = events[eventIndex]
    }
  }
}

// MARK: - Life Cycle
extension ScheduleViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    Server.fetchEvents { events in
      self.events.append(contentsOf: events)
      self.collectionView.reloadData()
    }
  }
}

// MARK: - UICollectionViewDataSource
extension ScheduleViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.reuseIdentifier, for: indexPath) as? EventCell else { fatalError() }
    cell.event = events[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return events.count
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ScheduleHeader.reuseIdentifier, for: indexPath) as? ScheduleHeader else { fatalError() }
    return header
  }  
}

// MARK: - UICollectionViewDelegate
extension ScheduleViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    
    performSegue(withIdentifier: .eventDetails, sender: indexPath.item)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ScheduleViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    let horizontalInsets = layout.sectionInset.left + layout.sectionInset.right
    
    return CGSize(width: collectionView.frame.width - horizontalInsets, height: collectionView.frame.height / 6)
  }
}

// MARK: - CreateEventDelegate
extension ScheduleViewController: CreateEventDelegate {
  func eventCreated(event: Event) {
    // TODO: - 
    events.insert(event, at: 0)
    let indexPath = IndexPath(item: 0, section: 0)
    collectionView.insertItems(at: [indexPath])
  }
}

// MARK: - @IBActions
private extension ScheduleViewController {
  @IBAction func addButtonTapped() {
    performSegue(withIdentifier: .createEvent, sender: nil)
  }
}
