//
//  ScheduleHeader.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class ScheduleHeader: UICollectionReusableView {
  static let reuseIdentifier = "\(ScheduleHeader.self)"
  
  @IBOutlet private var containerView: UIView! {
    didSet {
      containerView.layer.cornerRadius = 2
      containerView.layer.masksToBounds = true
    }
  }
}
