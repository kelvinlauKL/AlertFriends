//
//  GroupCell.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-13.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class GroupCell: UITableViewCell {
  static let reuseIdentifier = "\(GroupCell.self)"
  
  @IBOutlet fileprivate var nameLabel: UILabel!
  @IBOutlet fileprivate var colorView: UIView!
  @IBOutlet fileprivate var memberCountLabel: UILabel!
  
  var group: Group! {
    didSet {
      nameLabel.text = group.name
      colorView.backgroundColor = group.color
      memberCountLabel.text = "\(group.people.count) members"
    }
  }
}

// MARK: - UICollectionViewDataSource
extension GroupCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { fatalError() }
    cell.imageView.image = group.people[indexPath.item].image
    cell.filterView.alpha = 0
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return group.people.count
  }
}
