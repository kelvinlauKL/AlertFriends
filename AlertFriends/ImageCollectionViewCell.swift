//
//  ImageCollectionViewCell.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
  static let reuseIdentifier = "\(ImageCollectionViewCell.self)"
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var filterView: UIView!
  
  var category: Category! {
    didSet {
      imageView.image = category.image
    }
  }
  

  func removeFilter(_ shouldRemove: Bool) {
    filterView.alpha = shouldRemove ? 0 : 0.75
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    layer.cornerRadius = frame.height / 2
    layer.masksToBounds = true
  }
}
