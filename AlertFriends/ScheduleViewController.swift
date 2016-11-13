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

// MARK: - Life Cycle
extension ScheduleViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let horizontalInsets = layout.sectionInset.left + layout.sectionInset.right
    
    layout.itemSize = CGSize(width: collectionView.frame.width - horizontalInsets, height: collectionView.frame.height / 6)
    
    Server.fetchEvents { events in
      let previousCountOfEvents = events.count
      self.events.append(contentsOf: events)
      let newCountOfEvents = events.count
      
      let indexPaths = (previousCountOfEvents..<newCountOfEvents).map { IndexPath(item: $0, section: 0) }
      
      self.collectionView.insertItems(at: indexPaths)
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
