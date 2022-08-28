//
//  SignupTableViewCellModel.swift
//  Spender
//
//  Created by Tyler on 28/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

enum InputType {
    case textfield
    case email
    case selector
    case password
}

struct SignupTableViewCellModel {
    
    var title: String
    var inputType: InputType
    var value: String?
    var optional: Bool? = false
    var locked: Bool? = false
    var icon: String?
    
//    var name: String?
//    var nickname: String?
//    var email: String?
//    var dob: String?
//    var occupation: String?
//    var password: String?
//    var confirmPassword: String?
    
    
}
