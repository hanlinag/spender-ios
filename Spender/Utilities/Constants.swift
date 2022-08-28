//
//  Constants.swift
//  Spender
//
//  Created by Tyler on 13/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

enum LoginType: Codable {
    case email
    case facebook
    case gmail
    case biometric
    case apple
}

enum TransactionType {
    case expense
    case income
}

enum TransactionCategory {
    case shopping
    case food
    case eatingout
    case gas
    case grocery
    case drink
    case social
    case saving
    case transportation
    case personal
    case commodity
    case health
    case investment
    
    case salary
    case freelance
    case gift
}

enum SignupMode {
    case normal
    case providers
}

let signupTableCellModel = [
    SignupTableViewCellModel(title: "placeholder.name",       inputType: .textfield, value: ""),
    SignupTableViewCellModel(title: "placeholder.nickname",   inputType: .textfield, value: "", optional: true),
    SignupTableViewCellModel(title: "placeholder.email",      inputType: .email,     value: ""),
    SignupTableViewCellModel(title: "placeholder.dob",        inputType: .selector,  value: "", icon: "calendar"),
    SignupTableViewCellModel(title: "placeholder.occupation", inputType: .selector,  value: "", icon: "chevron.down"),
    SignupTableViewCellModel(title: "placeholder.password",   inputType: .password,  value: "", icon: "eye.fill"),
    SignupTableViewCellModel(title: "placeholder.confirm_pw", inputType: .password,  value: "", icon: "eye.fill")
]

let signupWithProvidersTableCellModel = [
    SignupTableViewCellModel(title: "placeholder.name",       inputType: .textfield, value: "", locked: true),
    SignupTableViewCellModel(title: "placeholder.nickname",   inputType: .textfield, value: "", optional: true),
    SignupTableViewCellModel(title: "placeholder.email",      inputType: .email,     value: "", locked: true),
    SignupTableViewCellModel(title: "placeholder.dob",        inputType: .selector,  value: "", icon: "calendar"),
    SignupTableViewCellModel(title: "placeholder.occupation", inputType: .selector,  value: "", icon: "chevron.down")
]
