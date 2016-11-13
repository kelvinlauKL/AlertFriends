//
//  AddContactViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class AddContactViewController: UIViewController {
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var phoneTextField: UITextField!
  @IBOutlet var emailTextField: UITextField!
  
  var contactList = [Contact]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func savePressed(_ sender: UIButton) {
    let newContact = Contact(name: "NAME", email: "anEmail@gmail.com", phoneNumber: "341-513-5501")
    //
    //        newContact.name = nameTextField.text ?? ""
    //        newContact.phone = phoneTextField.text ?? ""
    //        newContact.email = emailTextField.text ?? ""
    
    contactList.append(newContact)
    self.navigationController!.popViewController(animated: true)
  }
  
  @IBAction func cancelPressed(_ sender: UIButton) {
    self.navigationController!.popViewController(animated: true)
  }
  
  func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    nameTextField.resignFirstResponder()
    phoneTextField.resignFirstResponder()
    emailTextField.resignFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
}
