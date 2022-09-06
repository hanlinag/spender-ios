//
//  ProfileCell.swift
//  Spender
//
//  Created by Tyler on 06/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    
    static var identifier = "ProfileCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //imgProfile.makeCircleImageView()
        //self.makeCircle()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.makeCircle()
    }
    
    func cnnfigure(data: ProfilePicture) {
        imgProfile.image = UIImage(named: data.image)
        self.backgroundColor = UIColor(rgb: data.backgroundColor)
    }
}
