//
//  EventCell.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class EventCell: UICollectionViewCell {
  static let reuseIdentifier = "\(EventCell.self)"
  @IBOutlet fileprivate var imageView: UIImageView!
  @IBOutlet fileprivate var titleLabel: UILabel!
  @IBOutlet fileprivate var threatLabel: UILabel!
  @IBOutlet fileprivate var colorImageView: UIImageView!
  @IBOutlet fileprivate var durationLabel: UILabel!
  
  var event: Event! {
    didSet {
      imageView.image = event.image
      titleLabel.text = event.name
      threatLabel.text = "Threat level: \(event.threatLevel.description)"
      colorImageView.image = event.threatLevel.getColorImage(forRect: colorImageView.frame)
      durationLabel.text = "Duration: \(event.durationDescription)"
    }
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    imageView.layer.cornerRadius = imageView.frame.height / 2
    imageView.layer.masksToBounds = true
    layer.cornerRadius = 5
    layer.masksToBounds = true
  }
}
