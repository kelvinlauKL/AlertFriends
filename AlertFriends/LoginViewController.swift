//
//  LoginViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
  
}

// MARK: - SegueHandlerType
extension LoginViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case mainScreen
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .mainScreen:
      break
    }
  }
}
