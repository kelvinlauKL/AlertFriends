//
//  ListOfContactTableViewController.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit
class ListOfContactTableViewController: UITableViewController {
    var contactList = [Contact]()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.reloadData()

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
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return contactList.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let contact = contactList[indexPath.row]
    cell.textLabel?.text = contact.name
    
    return cell
  }
   // MARK: - Navigation
   // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let detailVC = segue.destination as? DetailContactViewController,
        let indexPath = tableView.indexPathForSelectedRow {
        let contact = contactList[indexPath.row]
        detailVC.contactDetail = contact
    }
//    else if let addVC = segue.destination as? AddContactViewController {
//        addVC.delegate = self
//    }
    
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
}
