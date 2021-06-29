//
//  User+CoreDataProperties.swift
//  CoreDataTask
//
//  Created by MacMini1 on 01/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var fname: String?
    @NSManaged public var gender: String?
    @NSManaged public var lname: String?
    @NSManaged public var mobile: NSDecimalNumber?
    @NSManaged public var password: String?
    @NSManaged public var userAddress: NSSet?

}

// MARK: Generated accessors for userAddress
extension User {

    @objc(addUserAddressObject:)
    @NSManaged public func addToUserAddress(_ value: Address)

    @objc(removeUserAddressObject:)
    @NSManaged public func removeFromUserAddress(_ value: Address)

    @objc(addUserAddress:)
    @NSManaged public func addToUserAddress(_ values: NSSet)

    @objc(removeUserAddress:)
    @NSManaged public func removeFromUserAddress(_ values: NSSet)

}
