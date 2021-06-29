//
//  ShowAllUserAddressesViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 01/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class ShowAllUserAddressesViewController: UIViewController {
    var user:User?
    var arrUserAddresses:[Address]?
    var coreDataModel = CoreDataModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "AddressTableViewCell", bundle: .main), forCellReuseIdentifier: "AddressTableViewCell")
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ShowAllUserAddressesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserAddresses!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        let lblTitle = "\(indexPath.row + 1)"
        let street = arrUserAddresses![indexPath.row].street
        let area = arrUserAddresses![indexPath.row].area
        let city = arrUserAddresses![indexPath.row].city
        let district = arrUserAddresses![indexPath.row].district
        let pincode = arrUserAddresses![indexPath.row].pincode
        let address = street! + ", " + area! + ", " + city! + ", " + district! + ", " + pincode!
        cell.setaddress(addlbl: lblTitle, wholeAddress: address)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let removeAddress = self.arrUserAddresses![indexPath.row]
            //print(self.user!)
            //print(removeAddress)
            let deleteFlag = self.coreDataModel.deleteUserAddress(user: self.user!, address: removeAddress)
            if(deleteFlag) {
                //print("Removed")
               
                DispatchQueue.main.async {
                     self.arrUserAddresses = self.coreDataModel.showAllAddresses(user: self.user!)
                    tableView.reloadData()
                }
            }
            else {
                print("Not Removed")
            }
          
        }
        let action2 = UIContextualAction(style: .normal, title: "Update") { (action, view, completionHandler) in
            let updateAddress = self.arrUserAddresses![indexPath.row]
            //print(self.user!)
            //print(updateAddress)
            
            let alert = UIAlertController(title: "Edit Address", message: "Change whatever you want", preferredStyle: .alert)
            let address = self.arrUserAddresses![indexPath.row]
            
            alert.addTextField { (textField) in
                textField.text = address.street
            }
            alert.addTextField { (textField) in
                textField.text = address.area
            }

            alert.addTextField { (textField) in
                textField.text = address.city
            }
            
            alert.addTextField { (textField) in
                textField.text = address.district
            }
            alert.addTextField { (textField) in
                textField.text = address.pincode
            }

            
            let editChange = UIAlertAction(title: "Save", style: .default) { (action) in

                let newStreet = alert.textFields![0].text
                let newArea = alert.textFields![1].text
                let newCity = alert.textFields![2].text
                let newDistrict = alert.textFields![3].text
                let newPincode = alert.textFields![4].text
                
                let dict = ["street" : newStreet, "area" : newArea, "city" : newCity, "district" : newDistrict, "pincode" : newPincode]
                let updateFlag = self.coreDataModel.updateUserAddress(oldAddress: updateAddress, newAddress: dict as [String : Any])

                if(updateFlag) {

                    DispatchQueue.main.async {
                        // self.arrUserAddresses = self.coreDataModel.showAllAddresses(user: self.user!)
                        tableView.reloadData()
                    }
                }
                else {
                    //print("Not updated")
                }
                
            }
            alert.addAction(editChange)
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [action,action2])
    }
    
}
