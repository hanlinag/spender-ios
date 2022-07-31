//
//  UIFont + Extension.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static let PyidaungsuBold =     "Pyidaungsu"
    static let PyidaungsuMedium =   "Pyidaungsu"
    static let PyidaungsuRegular =  "Pyidaungsu"
    
    class func appBold(size: CGFloat = 15) -> UIFont {
        switch Locale.currentLocale {
        case .MM: return UIFont(name: PyidaungsuBold, size: size)!
        default: return systemFont(ofSize: size)
        }
    }
    
    class func appMedium(size: CGFloat = 15) -> UIFont {
        switch Locale.currentLocale {
        case .MM: return UIFont(name: PyidaungsuMedium, size: size)!
        default: return systemFont(ofSize: size)
        }
    }
    
    class func appRegular(size: CGFloat = 15) -> UIFont {
        switch Locale.currentLocale {
        case .MM: return UIFont(name: PyidaungsuRegular, size: size)!
        default: return systemFont(ofSize: size)
        }
    }
    
    class func tabBarItem(size: CGFloat = 12) -> UIFont {
        return UIFont.appMedium(size: size)
    }
    
    class func navigationBarItem(size: CGFloat = 22) -> UIFont {
        return UIFont.appBold(size: size)
    }
    
    class func segmentedControlItem(size: CGFloat = 14) -> UIFont {
        return UIFont.appBold(size: size)
    }
}
