//
//  UserTableViewCell.swift
//  CoreDataTask
//
//  Created by MacMini1 on 26/02/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var fname: UILabel!

    @IBOutlet weak var mobile: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setUserData(ufname: String,umobile: String) {
        fname.text = ufname
        mobile.text = umobile
    }
    
}
