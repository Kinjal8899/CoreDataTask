//
//  File.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import Foundation

class ValidateFields {
    
    class func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    
    class func validateFirstName(fname: String) -> Bool {
        let nameFormat = "[A-Za-z]{3,20}"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameFormat)
        return namePredicate.evaluate(with: fname)
    }
    
    class func validateLastName(lname: String) -> Bool {
        let nameFormat = "[A-Za-z]{3,15}"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameFormat)
        return namePredicate.evaluate(with: lname)
    }
    
    class func validateMobile(mobile: String) -> Bool {
        let numberFormat = "[0-9]{10}"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberFormat)
        return numberPredicate.evaluate(with: mobile)
    }
    
    class func validatePassword(password: String) -> Bool {
        let numberFormat = "[A-Za-z@$!0-9]{6,20}"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberFormat)
        return numberPredicate.evaluate(with: password)
    }
}
