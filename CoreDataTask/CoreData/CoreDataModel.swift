//
//  CoreData.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataModel {
    
    private static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var users: [User]?
    public func addUser(fname: String, lname: String, email: String, mobile: Decimal, password: String, gender: String) -> Bool
    {
        do {
            let newUser = User(context: CoreDataModel.context)
            newUser.fname = fname
            newUser.lname = lname
            newUser.email = email
            newUser.mobile = mobile as NSDecimalNumber
            newUser.password = password
            newUser.gender = gender
            
            try CoreDataModel.context.save()
        } catch  {
            
        }
        return true
    }
    
    public func checkUser(email: String, password: String) -> Bool{
        
        let predicate = NSPredicate (format:"email = %@" ,email)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> ( entityName: "User")
        fetchRequest.predicate = predicate
        let fetchRecult = try! CoreDataModel.context.fetch(fetchRequest)
        if fetchRecult.count>0
        {
            let objectEntity : User = fetchRecult.first as! User
            if objectEntity.email == email && objectEntity.password == password
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
    }
  
    public func fetchOneUser(email: String) -> User {
        let user:User?
        let predicate = NSPredicate (format:"email = %@" ,email)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> ( entityName: "User")
        fetchRequest.predicate = predicate
        let fetchRecult = try! CoreDataModel.context.fetch(fetchRequest)
        if fetchRecult.count>0
        {
            user = (fetchRecult.first as! User)
            return user!
        }
        user = User()
        return user!
    }
    
    public func fetchAllUser() -> [User] {
        do {
            self.users = try CoreDataModel.context.fetch(User.fetchRequest())
        } catch {
            
        }
        return users!
    }
    
    public func deleteOneUser(user: User) -> Bool {
      
        do {
            CoreDataModel.context.delete(user)
            try CoreDataModel.context.save()
            return true
        } catch  {
            
        }
        return false
    }
    
    public func addUserAddress(user : User,street: String, area: String, city: String, district: String, pincode: String) -> Bool {
        do {
            let address = Address(context: CoreDataModel.context)
            address.street = street
            address.area = area
            address.city = city
            address.district = district
            address.pincode = pincode
            user.addToUserAddress(address)
            try CoreDataModel.context.save()
            return true
        } catch  {
            
        }
        return false
    }
    
    
    public func showAllAddresses(user: User) -> [Address] {
        let arrAddress = (user.userAddress?.allObjects as? [Address])!
        return arrAddress
    }
    
    public func deleteUserAddress(user: User, address: Address) -> Bool {
        do {
            user.removeFromUserAddress(address)
            try CoreDataModel.context.save()
            return true
        } catch  {
            
        }
        return false
    }
    
    public func updateUserAddress(oldAddress: Address, newAddress: [String: Any]) -> Bool {
     
        oldAddress.street = (newAddress["street"] as! String)
        oldAddress.area = (newAddress["area"] as! String)
        oldAddress.city = (newAddress["city"] as! String)
        oldAddress.district = (newAddress["district"] as! String)
        oldAddress.pincode = (newAddress["pincode"] as! String)
     
        do {
            try CoreDataModel.context.save()
            return true
        } catch {
            
        }
        return false
    }
    
    public func showAllAdresses() -> [Address] {
        var addresses:[Address]?
        do {
            addresses = try CoreDataModel.context.fetch(Address.fetchRequest())
        } catch  {
            
        }
        return addresses!
    }
    
    public func filterByCity(cityName: String) -> [Address] {
        var addresses:[Address]?
        do {
            let request = Address.fetchRequest() as NSFetchRequest<Address>
            let pred = NSPredicate(format: "city CONTAINS '\(cityName)' OR area CONTAINS '\(cityName)' OR street CONTAINS '\(cityName)' OR pincode CONTAINS '\(cityName)' OR district CONTAINS '\(cityName)'")
            request.predicate = pred
            addresses = try CoreDataModel.context.fetch(request)
        } catch  {
            
        }
        return addresses!
    }
}
