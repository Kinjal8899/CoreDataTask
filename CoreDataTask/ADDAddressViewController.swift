//
//  ADDAddressViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 01/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class ADDAddressViewController: UIViewController {
    var coreDataModel = CoreDataModel()
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtDistrict: UITextField!
    @IBOutlet weak var txtPincode: UITextField!
    
    @IBOutlet weak var btnSaveAddress: UIButton!
    
    var user:User?
    override func viewDidLoad() {
       
        super.viewDidLoad()
        //print(user!)

       
    }

    @IBAction func addAddressClicked(_ sender: UIButton) {
        if txtStreet.text!.isEmpty || txtArea.text!.isEmpty || txtCity.text!.isEmpty || txtDistrict.text!.isEmpty || txtPincode.text!.isEmpty {
            let alert = UIAlertController(title: "Invalid", message: "Please fill up all the details", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let street = txtStreet.text
            let area = txtArea.text
            let city = txtCity.text
            let district = txtDistrict.text
            let pincode = txtPincode.text
            let addFlag = coreDataModel.addUserAddress(user: user!, street: street!, area: area!, city: city!, district: district!, pincode: pincode!)
            if(addFlag) {
                //print("Address details are saved...")
                let alert = UIAlertController(title: "Success", message: "Address details are saved.", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
                    self.txtStreet.text = ""
                    self.txtArea.text = ""
                    self.txtCity.text = ""
                    self.txtDistrict.text = ""
                    self.txtPincode.text = ""
                }
                alert.addAction(saveAction)
                self.present(alert, animated: true, completion: nil)
                
            }
            else {
                 print("Sorry,Address details are not saved...")
            }
        }
    }
    
    @IBAction func showAddressClicked(_ sender: UIButton) {
        let arrUserAddresses = coreDataModel.showAllAddresses(user: user!)
        if arrUserAddresses.count > 0 {
            //print(arrUserAddresses)
            let aVC = self.storyboard?.instantiateViewController(identifier: "ShowAllUserAddressesViewController") as! ShowAllUserAddressesViewController
            aVC.arrUserAddresses = arrUserAddresses
            aVC.user = user
            self.navigationController?.pushViewController(aVC, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Sorry", message: "This user doesn't have any addresses yet saved.", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
