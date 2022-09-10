//
//  WalletsCell.swift
//  Spender
//
//  Created by Tyler on 03/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class WalletsCell: UITableViewCell {
    
    
    static var identifier = "WalletsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WalletsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure() {
        
    }
    
}
