//
//  TransactionHeaderCell.swift
//  Spender
//
//  Created by Tyler on 04/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class TransactionHeaderCell: UITableViewCell {

    @IBOutlet weak var imgTransaction: UIImageView!
    
    static var identifier = "TransactionHeaderCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TransactionHeaderCell", bundle: nil)
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
