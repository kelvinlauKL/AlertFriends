//
//  DetailContactViewController.swift
//  AlertFriends
//
//  Created by Asuka Nakagawa on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

class DetailContactViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var contactDetail = Contact(name: "Alan", email: "anEmail@gmail.com", phoneNumber: "341-513-5501")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel.text = contactDetail.name
        emailLabel.text = contactDetail.email
        phoneLabel.text = contactDetail.phoneNumber
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
