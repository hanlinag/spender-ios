//
//  LoginRequest.swift
//  Spender
//
//  Created by Tyler on 13/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation



struct LoginRequest: Codable {
    let email: String
    let password: String
    let loginType: LoginType
}
