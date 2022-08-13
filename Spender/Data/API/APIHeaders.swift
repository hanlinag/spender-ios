//
//  APIHeaders.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

//// Add API Headers here
///

import Foundation
import RxSwift
import RxCocoa

extension API {
    static var tokenExists: Bool { return API.Headers.token != nil }
}

extension API.Headers {
    
    private(set) static var token: String? {
        get {
            return UserDefaultsUtils.userAccountToken ?? ""
        }
        set {
            UserDefaultsUtils.userAccountToken = newValue
        }
    }
    
    
    static func all() -> [String : String] {
        var all = [String: String]()
        
        if let token = token { all["Authorization"] = token }
        
        all["app_version"]    =      Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        all["os_version"]     =      UIDevice.current.systemVersion
        all["device_model"]   =      UIDevice.modelName //custom mapping method
        all["language"]       =      Locale.currentLocale.rawValue
        all["Accept"]         =      "application/json"
        
        all["device_id"]      =     UIDevice.current.identifierForVendor?.uuidString //This will change everytime user reinstall the app
        all["os"]             =     "iOS"
        all["app_id"]         =     Bundle.main.bundleIdentifier
        all["user_id"]        =     UserDefaultsUtils.currentUserID
        
        return all
    }
    
    //to call when user log out
    static func clearAll() {
        UserDefaultsUtils.deleteAPIToken()
        UserDefaultsUtils.deleteCurrentUserID()
    }
}
