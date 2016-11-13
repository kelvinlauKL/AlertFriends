//
//  Server+Events.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

extension Server {
  static func fetchEvents(completion: @escaping ([Event]) -> ()) {
    let groups = Server.testGroups
    
    let event1 = Event(name: "Grocery Shopping", image: #imageLiteral(resourceName: "groceryShopping"), threatLevel: .low, duration: 3600, targetGroup: groups[3])
    let event2 = Event(name: "Party", image: #imageLiteral(resourceName: "party"), threatLevel: .high, duration: 14400, targetGroup: groups[1])
    let event3 = Event(name: "Running", image: #imageLiteral(resourceName: "running"), threatLevel: .high, duration: 3600, targetGroup: groups[3])
    let event4 = Event(name: "Shopping", image: #imageLiteral(resourceName: "shopping"), threatLevel: .medium, duration: 14400, targetGroup: groups[1])
    let event5 = Event(name: "SightSeeing", image: #imageLiteral(resourceName: "sightseeing"), threatLevel: .medium, duration: 14400, targetGroup: groups[1])
    completion([event1, event2, event3, event4, event5])
  }
}
