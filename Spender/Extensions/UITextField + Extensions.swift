//
//  UITextField + Extensions.swift
//  Spender
//
//  Created by Tyler on 28/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setRightImage(icon: UIImage?) {
        
        self.rightViewMode = .always
        
        let imageView        = UIImageView(image: icon?.withInset(UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)))
        imageView.frame      = CGRect(x: 0, y: 0, width: 23 , height:23)
        
        self.rightView = imageView
    }
}
