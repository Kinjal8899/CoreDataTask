//
//  SignInViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var coreDataModel = CoreDataModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinClicked(_ sender: UIButton) {
        
        if email.text!.isEmpty || password.text!.isEmpty
        {
            let alert = UIAlertController(title: "Invalid", message: "Please provide both credentials ", preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
                
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if ValidateFields.validateEmail(enteredEmail: email.text!) == false{
           let alert = UIAlertController(title: "Email", message: "Please enter valid email", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if ValidateFields.validatePassword(password: password.text!) == false {
            let alert = UIAlertController(title: "Password", message: "Please give at least 6 letter password", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let uEmail = email.text
            let uPAssword = password.text
            var logFlag:Bool?
            logFlag = coreDataModel.checkUser(email: uEmail!, password: uPAssword!)
            
            if(logFlag!) {
                
                let userDefaults = UserDefaults.standard
                userDefaults.setValue(uEmail!, forKey: "loggedIn")
                userDefaults.setValue(uPAssword!, forKey: "password")
                
                
                let aVC = self.storyboard?.instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
                aVC.uEmail = uEmail!
                self.navigationController?.pushViewController(aVC, animated: true)
            }
            else {
                let alert = UIAlertController(title: "Invalid Email/Password", message: "Please provide correct credentials ", preferredStyle: .alert)
                           
                let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
                               
                }
                alert.addAction(saveAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
