//
//  Contact.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

struct Contact {
  var name: String
  var email: String
  var phoneNumber: String
  var image = #imageLiteral(resourceName: "profilePlaceholder")
}

extension Contact {
  init(name: String, email: String, phoneNumber: String, image: UIImage? = nil) {
    self.name = name
    self.email = email
    self.phoneNumber = phoneNumber
    
    if let image = image {
      self.image = image
    } else {
      self.image = #imageLiteral(resourceName: "profilePlaceholder")
    }
  }
}
