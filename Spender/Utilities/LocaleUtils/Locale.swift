//
//  Locales.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

enum Locale: String {
    case EN = "en"
    case MM = "mm"
    case TH = "th"
    
    private static let defaultLocale = EN
    
    static let localeChangedNotification = "Locale.currentLocaleDidChangeNotification"
    
    
    //getter and setter for current locale
    static var currentLocale : Locale {
        get { return Locale(rawValue: UserDefaultsUtils.currentLocale ?? "en" ) ?? defaultLocale }
        set {
            UserDefaultsUtils.currentLocale = newValue.rawValue
            
            //refresh app
            UIApplication.shared.localize()
            NotificationCenter.default.post(name: Notification.Name(rawValue: localeChangedNotification), object: nil)
            
        }
    }
    
    var nsLocale: Foundation.Locale {
        switch self {
        case .EN: return Foundation.Locale(identifier: "en")
        case .MM: return Foundation.Locale(identifier: "mm")
        case .TH: return Foundation.Locale(identifier: "th")
        }
    }
    
    
}

//locale String - get data from specific .string file based on the current locale set.
extension String {
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: "", table: UserDefaultsUtils.currentLocale)
    }
}

