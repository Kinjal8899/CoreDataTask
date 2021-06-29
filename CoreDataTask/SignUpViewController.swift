//
//  SignUpViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fbtn: UIButton!
    @IBOutlet weak var mbtn: UIButton!
    
    var gender:String?
    var coreDataModel = CoreDataModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func genderClicked(_ sender: UIButton) {
            
        if sender.tag == 1 {
            fbtn.isSelected = true
            mbtn.isSelected = false
            gender = "Female"
        }
        else{
            fbtn.isSelected = false
            mbtn.isSelected = true
            gender = "Male"
        }
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        
        if fname.text!.isEmpty || lname.text!.isEmpty || email.text!.isEmpty || mobile.text!.isEmpty || password.text!.isEmpty || (fbtn.isSelected == false && mbtn.isSelected == false) {
            let alert = UIAlertController(title: "Invalid", message: "Please fill up all the details", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
            
        else if ValidateFields.validateFirstName(fname: fname.text!) == false {
            let alert = UIAlertController(title: "First Name", message: "Please enter proper name, name should contain at least 3 and at most 20 letters", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }

        else if ValidateFields.validateLastName(lname: lname.text!) == false {
            let alert = UIAlertController(title: "Last Name", message: "Please enter proper last name,  last name should contain at least 3 and at most 15 letters", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }

        else if ValidateFields.validateEmail(enteredEmail: email.text!) == false {
//            let alertDisapperTimeInSeconds = 2.0
//            let alert = UIAlertController(title: nil, message: "Email is not valid", preferredStyle: .actionSheet)
//            self.present(alert, animated: true)
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertDisapperTimeInSeconds) {
//              alert.dismiss(animated: true)
//            }
            let alert = UIAlertController(title: "Email", message: "Please enter proper email", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }

        else if ValidateFields.validateMobile(mobile: "\(mobile.text!)") == false {
             let alert = UIAlertController(title: "Mobile", message: "Please eneter 10 digit mobile number", preferredStyle: .alert)
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

        else if fbtn.isSelected == false && mbtn.isSelected == false {
            let alert = UIAlertController(title: "Gender", message: "Please select your gender", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)        }

        else {
            let ufName = self.fname.text
            let ulName = self.lname.text
            let uEmail = self.email.text
            let uMobile = Decimal(string: self.mobile.text!)
            let uPassword = self.password.text
            var addFlag:Bool?
            addFlag = self.coreDataModel.addUser(fname: ufName!, lname: ulName!, email: uEmail!, mobile: uMobile!, password: uPassword!, gender: self.gender!)
            if(addFlag!) {
                let aVC = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
                self.navigationController?.pushViewController(aVC, animated: true)
            }
        }
    }
}

