//
//  AllAddressesViewController.swift
//  CoreDataTask
//
//  Created by MacMini1 on 02/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class AllAddressesViewController: UIViewController, UISearchBarDelegate {
    var coreDataModel = CoreDataModel()
    var addresses:[Address]?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.register(UINib(nibName: "AllAddressCell", bundle: .main), forCellReuseIdentifier: "AllAddressCell")
       DispatchQueue.main.async {
           self.tableView.reloadData()
       }
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        addresses?.removeAll()
        addresses = coreDataModel.filterByCity(cityName: searchText)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        if addresses?.count == 0 {
            searchActive = true
        }
        else {
            searchActive = false
        }
    }
}
extension AllAddressesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllAddressCell", for: indexPath) as! AllAddressCell
        
        let currentRow = addresses![indexPath.row]
        
        var userFname,userLname:String
        if let user = currentRow.addressUser {
            userFname = user.fname ?? "-"
            userLname = user.lname ?? "-"
            let fullName = userFname + " " + userLname
            let street = currentRow.street ?? ""
            let area = currentRow.area ?? ""
            let city = currentRow.city ?? ""
            let district = currentRow.district ?? ""
            let pincode = currentRow.pincode ?? ""
            let userAdd = street + ", " + area + ", " + city + ", " + district + ", " + pincode
            cell.setItems(username: fullName, address: userAdd)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
