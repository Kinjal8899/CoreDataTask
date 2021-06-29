//
//  User+CoreDataProperties.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: NSDecimalNumber?
    @NSManaged public var password: String?
    @NSManaged public var gender: String?

}
