//
//  HomeMiddleCell.swift
//  Spender
//
//  Created by Tyler on 02/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

protocol AddTransactionButtonDelegate {
    func addTransactionDidPress()
}

class HomeMiddleCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblTotalCurrency: UILabel!
    
    @IBOutlet weak var btnAddTransaction: UIButton!
    
    
    @IBOutlet weak var imgIncome: UIImageView!
    @IBOutlet weak var lblIncomeAmount: UILabel!
    
    @IBOutlet weak var imgOutcome: UIImageView!
    @IBOutlet weak var lblOutcomeAmount: UILabel!
    
    var delegate: AddTransactionButtonDelegate?
    
    static var identifier = "HomeMiddleCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeMiddleCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func buttonAddTransactionDidTap(_ sender: Any) {
        delegate?.addTransactionDidPress()
    }
}
