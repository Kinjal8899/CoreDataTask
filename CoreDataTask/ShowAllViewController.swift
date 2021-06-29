//
//  ShowAllViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class ShowAllViewController: UIViewController {
    
    var coreDataModel = CoreDataModel()
    var users:[User]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: .main), forCellReuseIdentifier: "UserTableViewCell")
        users = coreDataModel.fetchAllUser()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
extension ShowAllViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        //cell.ufname = users![indexPath.row].fname
        cell.setUserData(ufname: users![indexPath.row].fname ?? "", umobile: "\(users![indexPath.row].mobile ?? 0)")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Alert", message: "Do you want to enter address details of \(users![indexPath.row].fname!)", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            let aVC = self.storyboard?.instantiateViewController(identifier: "ADDAddressViewController") as! ADDAddressViewController
            aVC.user = self.users![indexPath.row]
            self.navigationController?.pushViewController(aVC, animated: true)
        }
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let removeUser = self.users![indexPath.row]
            
            let removeFlag = self.coreDataModel.deleteOneUser(user: removeUser)
            if(removeFlag) {
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
            else {
                
            }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
