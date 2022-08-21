//
//  SignupHeaderView.swift
//  Spender
//
//  Created by Tyler on 21/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class SignupHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    static var identifier = "SignupHeaderView"

    
    static func nib() -> UINib {
        return UINib(nibName: "SignupHeaderView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func configure(title: String, description: String) {
        lblTitle?.text    = title.localized
        lblSubTitle?.text = description.localized
    }
}
