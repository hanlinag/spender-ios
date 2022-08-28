//
//  UIView + Extensions.swift
//  Spender
//
//  Created by Tyler on 28/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor   = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset  = offSet
        layer.shadowRadius  = radius
        
        layer.shadowPath         = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize    = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
