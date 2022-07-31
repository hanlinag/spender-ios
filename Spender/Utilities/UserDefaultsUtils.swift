//
//  UserDefaultsUtils.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

private enum UserDefaultsKey: String {
    case appCurrentLocale =  "appCurrentLocale"
}

final class UserDefaultsUtils {
    static var currentLocale: String? {
        set { _set(value: newValue, key: .appCurrentLocale) }
        get { return _get(valueForKey: .appCurrentLocale) as? String ?? "" }
    }
    
    //private methods
    private static func _set(value: Any?, key: UserDefaultsKey) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    private static func _get(valueForKey key: UserDefaultsKey)-> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
    
    static func deleteCurrentLocale() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.appCurrentLocale.rawValue)
    }
}

