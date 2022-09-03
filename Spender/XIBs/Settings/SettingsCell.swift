//
//  SettingsCell.swift
//  Spender
//
//  Created by Tyler on 03/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    static var identifier = "SettingsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SettingsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
