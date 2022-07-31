//
//  TransactionTableViewCell.swift
//  Spender
//
//  Created by Tyler on 25/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var amount: UILabel!
    
    static var identifier = "TransactionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TransactionTableViewCell", bundle: nil)
    }
    
    public func configure(image: String, title: String, date: String, amount: String) {
        self.img.image = UIImage(systemName: image)
        self.title.text = title
        self.date.text = date
        self.amount.text = amount
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
