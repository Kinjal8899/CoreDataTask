//
//  ViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 25/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let userDefault = UserDefaults.standard
        if let loginEmail = userDefault.string(forKey: "email") {
            if userDefault.string(forKey: "password") != nil {
                //print(loginEmail)
                //print(loginPassword)
                let aVC = self.storyboard?.instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
                aVC.uEmail = loginEmail
                self.navigationController?.pushViewController(aVC, animated: true)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let userDefault = UserDefaults.standard
        if let loginEmail = userDefault.string(forKey: "email") {
            if userDefault.string(forKey: "password") != nil {
                //print(loginEmail)
                //print(loginPassword)
                let aVC = self.storyboard?.instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
                aVC.uEmail = loginEmail
                self.navigationController?.pushViewController(aVC, animated: true)
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        
        let aVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(aVC, animated: true)
    }
    
    @IBAction func signinClicked(_ sender: UIButton) {
        
        let aVC = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
               self.navigationController?.pushViewController(aVC, animated: true)
    }
}

