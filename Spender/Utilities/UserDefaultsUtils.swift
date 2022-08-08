//
//  UserDefaultsUtils.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

private enum UserDefaultsKey: String {
    case appCurrentLocale         =  "appCurrentLocale"
    case userAccountToken         =  "userAccountLoginToken"
    case isBiometricRegister      =  "isBiometricRegister"
}

final class UserDefaultsUtils {
    static var currentLocale: String? {
        set { _set(value: newValue, key: .appCurrentLocale) }
        get { return _get(valueForKey: .appCurrentLocale) as? String ?? "" }
    }
    
    static var userAccountToken: String? {
        set { _set(value: newValue, key: .userAccountToken) }
        get { return _get(valueForKey: .userAccountToken) as? String ?? "" }
    }
    
    static var isBiometricRegister: String? {
        set { _set(value: newValue, key: .isBiometricRegister) }
        get { return _get(valueForKey: .isBiometricRegister) as? String ?? "" }
    }
    
    //MARK: - Remove Methods
    static func deleteCurrentLocale() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.appCurrentLocale.rawValue)
    }
    
    static func deleteAPIToken() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userAccountToken.rawValue)
    }
    
    static func deleteBiometricRegister() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.isBiometricRegister.rawValue)
    }
    
    //MARK: - private methods
    private static func _set(value: Any?, key: UserDefaultsKey) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    private static func _get(valueForKey key: UserDefaultsKey)-> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}

