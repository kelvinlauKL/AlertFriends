//
//  Server+Contacts.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Foundation

extension Server {
  static func getContacts(completion: @escaping ([Contact]) -> ()) {
    // dispatching to a background thread
    DispatchQueue.global(qos: .background).async {
        let contact1 = Contact(name:"Judy", email:"judy1934@gmail.com", phoneNumber:"7786471293")
    
        let contact2 = Contact(name:"Rachel", email:"rachelrachel@hotmail.com", phoneNumber:"77829320192")
        let contact3 = Contact(name:"Tom", email:"tome394859@gmail.com",
            phoneNumber: "7781203493")
        let contact4 = Contact(name:"Jerry", email:"jerry2938@yahoo.com", phoneNumber:"6041837482")
        let contact5 = Contact(name:"Kathy", email:"kathy374@hotmail.com", phoneNumber:"4850394859")
        
        // dispatch main thread
        DispatchQueue.main.async {
            completion([contact1, contact2, contact3, contact4, contact5])
        }
    }

  }
    

}
