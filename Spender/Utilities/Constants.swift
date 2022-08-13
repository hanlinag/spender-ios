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
