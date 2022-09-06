//
//  AuthVM.swift
//  Spender
//
//  Created by Tyler on 19/06/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

struct ProfilePicture {
    let image: String
    let backgroundColor: Int
}

final class AuthVM: NSObject {
    static let shared = AuthVM()
    
    var accountStatus: String? = ""
    
    var signupMode: SignupMode = .normal //Default
    
    func clearAuthInfo() {
        self.accountStatus = nil
    }
}
