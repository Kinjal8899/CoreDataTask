//
//  Address+CoreDataProperties.swift
//  CoreDataTask
//
//  Created by MacMini1 on 01/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var street: String?
    @NSManaged public var area: String?
    @NSManaged public var city: String?
    @NSManaged public var district: String?
    @NSManaged public var pincode: String?
    @NSManaged public var addressUser: User?

}
