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
    case dateSelector
    case password
}

struct SignupTableViewCellModel {
    
    var title: String
    var inputType: InputType
    var value: String?
    var optional: Bool? = false
    var locked: Bool? = false
    var icon: String?
    var order: Int
    
}
