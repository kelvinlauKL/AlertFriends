//
//  Event.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

struct Event {
  enum ThreatLevel: CustomStringConvertible {
    case low, medium, high
    
    func getColorImage(forRect rect: CGRect) -> UIImage {
      switch self {
      case .low:
        return #imageLiteral(resourceName: "greenDot")
      case .medium:
        return #imageLiteral(resourceName: "orangeDot")
      case .high:
        return #imageLiteral(resourceName: "redDot")
      }
    }
    
    static var allValues: [ThreatLevel] {
      return [.low, .medium, .high]
    }
    
    var description: String {
      switch self {
      case .low:
        return "Low"
      case .medium:
        return "Medium"
      case .high:
        return "High"
      }
    }
  }
  
  var name: String
  var image: UIImage
  var threatLevel: ThreatLevel
  var duration: TimeInterval
}
