//
//  ListingsTableViewCell.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class ListingsTableViewCell: UITableViewCell {

  @IBOutlet weak var imgvListing: UIImageView!
  @IBOutlet weak var lblAddressListing: UILabel!
  @IBOutlet weak var lblPrice: UILabel!
  @IBOutlet weak var lblBedsBaths: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
  
  }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
