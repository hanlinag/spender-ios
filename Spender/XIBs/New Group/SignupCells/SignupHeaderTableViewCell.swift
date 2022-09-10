//
//  SignupHeaderTableViewCell.swift
//  Spender
//
//  Created by Tyler on 28/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class SignupHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    
    static var identifier = "SignupHeaderTableViewCell"

    
    static func nib() -> UINib {
        return UINib(nibName: "SignupHeaderTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(signupMode: SignupMode) {
    
        if signupMode == .normal {
            labelTitle?.text    = "title.create_account".localized
            labelSubtitle?.text = "desc.create_account".localized
        } else {
            labelTitle?.text    = "title.one_more_step".localized
            labelSubtitle?.text = "desc.one_more_step".localized
        }
        
    }
}
