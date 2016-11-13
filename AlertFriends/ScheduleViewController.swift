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

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let horizontalInsets = layout.sectionInset.left + layout.sectionInset.right
    
    layout.itemSize = CGSize(width: collectionView.frame.width - horizontalInsets, height: collectionView.frame.height / 6)
    
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
