//
//  AllAddressCell.swift
//  CoreDataTask
//
//  Created by MacMini1 on 02/03/21.
//  Copyright © 2021 bacancy. All rights reserved.
//

import UIKit

class AllAddressCell: UITableViewCell {

    @IBOutlet weak var lblUserName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setItems(username: String, address: String) {
        lblUserName.text = username
        lblAddress.text = address
    }
    
}
