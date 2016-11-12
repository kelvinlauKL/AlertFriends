//
//  LoginViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
  @IBOutlet fileprivate var emailTextField: UITextField!
  @IBOutlet fileprivate var passwordTextField: UITextField!
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

// MARK: - @IBActions
private extension LoginViewController {
  @IBAction func loginButtonTapped() {
    Server.login(withEmail: emailTextField.text!, password: passwordTextField.text!) { response in
      switch response {
      case .success:
        self.performSegue(withIdentifier: .mainScreen, sender: nil)
      case .failure(let message):
        self.displayAlert(withMessage: message)
      }
    }
  }
  
  @IBAction func signupButtonTapped() {
    Server.createAccount(withEmail: emailTextField.text!, password: passwordTextField.text!) { response in
      switch response {
      case .success:
        break
      case .failure(let message):
        self.displayAlert(withMessage: message)
      }
    }
  }
}
