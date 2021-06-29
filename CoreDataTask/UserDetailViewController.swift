//
//  UserDetailViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    var coreDataModel = CoreDataModel()
    var uEmail:String?
    var addresses:[Address]?
    @IBOutlet weak var fname: UILabel!
    
    @IBOutlet weak var lname: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var mobile: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var password: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = coreDataModel.fetchOneUser(email: uEmail!)
        fname.text = user.fname
        lname.text = user.lname
        email.text = user.email
        mobile.text = "\(String(describing: user.mobile!))"
        gender.text = user.gender
        password.text = user.password
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func logoutClicked(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        if userDefaults.string(forKey: "email") != nil {
            if userDefaults.string(forKey: "password") != nil {
                userDefaults.removeObject(forKey: "email")
                userDefaults.removeObject(forKey: "password")
                userDefaults.synchronize()
                let aVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
                self.navigationController?.pushViewController(aVC, animated: true)
        }
        }
    }
    
    
    
    
    @IBAction func showAllClicked(_ sender: UIButton) {
        let aVC = self.storyboard?.instantiateViewController(identifier: "ShowAllViewController") as! ShowAllViewController
        self.navigationController?.pushViewController(aVC, animated: true)
    }
    
    
    @IBAction func showAllAddressClicked(_ sender: UIButton) {
        addresses = coreDataModel.showAllAdresses()
        let aVC = self.storyboard?.instantiateViewController(identifier: "AllAddressesViewController") as! AllAddressesViewController
        aVC.addresses = addresses
        self.navigationController?.pushViewController(aVC, animated: true)
    }
}
