//
//  HomeFooterCell.swift
//  Spender
//
//  Created by Tyler on 02/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class HomeFooterCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var identifier = "HomeFooterCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeFooterCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
