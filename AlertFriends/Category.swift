//
//  Category.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

enum Category {
  case grocery, party, running, shopping, sightseeing
  
  var image: UIImage {
    switch self {
    case .grocery:
      return #imageLiteral(resourceName: "groceryShopping")
    case .party:
      return #imageLiteral(resourceName: "party")
    case .running:
      return #imageLiteral(resourceName: "running")
    case .shopping:
      return #imageLiteral(resourceName: "shopping")
    case .sightseeing:
      return #imageLiteral(resourceName: "sightseeing")
    }
  }
  
  static var allValues: [Category] {
    return [.grocery, .party, .running, .shopping, .sightseeing]
  }
}
