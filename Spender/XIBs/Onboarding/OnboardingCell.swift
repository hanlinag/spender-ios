//
//  OnboardingCell.swift
//  Spender
//
//  Created by Tyler on 05/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    static var identifier = "OnboardingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OnboardingCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: OnboardingStruct) {
        img.image = UIImage(named: data.image)
        lblTitle.text = data.title
        lblSubtitle.text = data.subtitle
    }
}
