//
//  HomeCardCell.swift
//  Spender
//
//  Created by Tyler on 02/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class HomeCardCell: UITableViewCell {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    static var identifier = "HomeCardCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeCardCell", bundle: nil)
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
