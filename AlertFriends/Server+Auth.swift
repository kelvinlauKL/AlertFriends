//
//  Server+Auth.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Firebase

extension Server {
  enum AuthResponse {
    case success
    case failure(String)
  }
  
  static func createAccount(withEmail email: String, password: String, completion: @escaping (AuthResponse) -> ()) {
    guard let auth = FIRAuth.auth() else { return completion(.failure("Couldn't even get \"FIRAuth.auth()\"!")) }
    auth.createUser(withEmail: email, password: password) { _, error in
      if let error = error {
        completion(.failure(error.localizedDescription))
      } else {
        completion(.success)
      }
    }
  }
  
  static func login(withEmail email: String, password: String, completion: @escaping (AuthResponse) -> ()) {
    guard let auth = FIRAuth.auth() else { return completion(.failure("Couldn't even get \"FIRAuth.auth()\"!")) }
    auth.signIn(withEmail: email, password: password) { _, error in
      if let error = error {
        completion(.failure(error.localizedDescription))
      } else {
        completion(.success)
      }
    }
  }
  
  static func logout(completion: @escaping (Bool) -> ()) {
    guard let auth = FIRAuth.auth() else { return completion(false) }
    do {
      try auth.signOut()
      completion(true)
    } catch {
      completion(false)
    }
  }
}
