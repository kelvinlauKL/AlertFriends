//
//  Server+Events.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

extension Server {
  static func fetchEvents(completion: @escaping ([Event]) -> ()) {
    let event1 = Event(name: "Grocery Shopping", image: #imageLiteral(resourceName: "groceryShopping"), threatLevel: .low, duration: 1000)
    completion([event1])
  }
}
