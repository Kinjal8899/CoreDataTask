//
//  AddressTableViewCell.swift
//  CoreDataTask
//
//  Created by MacMini1 on 01/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblAddTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setaddress(addlbl: String, wholeAddress: String) {
        lblAddTitle.text = "Address \(addlbl)"
        lblAddress.text = wholeAddress
    }
    
}
