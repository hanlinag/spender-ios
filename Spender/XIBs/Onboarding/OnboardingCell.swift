//
//  OnboardingCell.swift
//  Spender
//
//  Created by Tyler on 05/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    static var identifier = "OnboardingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OnboardingCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
