//
//  AddContactViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreateContact(_ contact: Contact)
}

final class AddContactViewController: UIViewController {
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var phoneTextField: UITextField!
    
    var contactList = [Contact]()
    
    weak var delegate: AddContactDelegate?
  override func viewDidLoad() {
    super.viewDidLoad()
    

    
    let contact1 = Contact(name: "Alan", email: "anEmail@gmail.com", phoneNumber: "341-513-5501"),
    contact2 = Contact(name: "Brian", email: "brian@gmail.com", phoneNumber: "341-513-5501"),
    contact3 = Contact(name: "John", email: "john@gmail.com", phoneNumber: "341-513-5501"),
    contact4 = Contact(name: "Sally", email: "sally@gmail.com", phoneNumber: "341-513-5501"),
    contact5 = Contact(name: "Colin", email: "colin@gmail.com", phoneNumber: "341-513-1111"),
    contact6 = Contact(name: "Susan", email: "susan@gmail.com", phoneNumber: "341-513-5501"),
    contact7 = Contact(name: "Mary", email: "mary@gmail.com", phoneNumber: "341-513-5501")
    
    contactList.append(contact1)
    contactList.append(contact2)
    contactList.append(contact3)
    contactList.append(contact4)
    contactList.append(contact5)
    contactList.append(contact6)
    contactList.append(contact7)
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func savePressed(_ sender: UIButton) {
    
//    let newContact = Contact(name: "NAME", email: "anEmail@gmail.com", phoneNumber: "341-513-5501")
    let newContact = Contact(name: "\(nameTextField.text ?? "")", email: "\(phoneTextField.text ?? "")", phoneNumber: "\(emailTextField.text ?? "")")
    
    delegate?.didCreateContact(newContact)
    print("After added-- ")
    print(contactList)
    
    navigationController!.popViewController(animated: true)
  }
  
  @IBAction func cancelPressed(_ sender: UIButton) {
    navigationController!.popViewController(animated: true)
  }
  
  func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    nameTextField.resignFirstResponder()
    emailTextField.resignFirstResponder()
    phoneTextField.resignFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
   // MARK: - Navigation
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   }
    
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
}
