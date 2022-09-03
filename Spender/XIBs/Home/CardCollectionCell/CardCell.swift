//
//  CardCell.swift
//  Spender
//
//  Created by Tyler on 02/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var balanceAmount: UILabel!
    @IBOutlet weak var currency: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    static var identifier = "CardCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CardCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius  = 20
    }
    
    func config() {
        
    }

}
