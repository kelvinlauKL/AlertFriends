//
//  Server+Groups.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-13.
//  Copyright © 2016 Kelvin. All rights reserved.
//

extension Server {
  static var testGroups: [Group] {
    let group1 = Group(name: "Company", people: [], color: .red)
    let group2 = Group(name: "Close Friends", people: [], color: .orange)
    let group3 = Group(name: "Acquaintances", people: [], color: .green)
    let group4 = Group(name: "Family", people: [], color: .yellow)
    let group5 = Group(name: "Relatives", people: [], color: .blue)
    return [group1, group2, group3, group4, group5]
  }
  
  static func fetchGroups(completion: @escaping ([Group]) -> ()) {
    let group1 = Group(name: "Company", people: [], color: .red)
    let group2 = Group(name: "Close Friends", people: [], color: .orange)
    let group3 = Group(name: "Acquaintances", people: [], color: .green)
    let group4 = Group(name: "Family", people: [], color: .yellow)
    let group5 = Group(name: "Relatives", people: [], color: .blue)
    completion([group1, group2, group3, group4, group5])
  }
}
