//
//  AuthVM.swift
//  Spender
//
//  Created by Tyler on 19/06/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

final class AuthVM: NSObject {
    static let shared = AuthVM()
    
    var accountStatus: String? = ""
    
    func clearAuthInfo() {
        self.accountStatus = nil
    }
}
