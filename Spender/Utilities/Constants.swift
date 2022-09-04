//
//  Constants.swift
//  Spender
//
//  Created by Tyler on 13/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

//MARK: - Enums
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

enum StoryboardType: String {
    case EditProfile
    case Feedback
    case WalletSetup
    case ChangeLanguage
    case ChangePassword
    case LegalAndPrivacy
    case AllTransactions
    
    var string: String {
        return self.rawValue
    }
}

//MARK: - Local Data
private var signupTableCellModel = [
    SignupTableViewCellModel(title: "placeholder.name",       inputType: .textfield,    value: "", order: 0),
    SignupTableViewCellModel(title: "placeholder.nickname",   inputType: .textfield,    value: "", optional: true,  order: 1),
    SignupTableViewCellModel(title: "placeholder.email",      inputType: .email,        value: "", order: 2),
    SignupTableViewCellModel(title: "placeholder.dob",        inputType: .dateSelector, value: "", icon: "calendar", order: 3),
    SignupTableViewCellModel(title: "placeholder.occupation", inputType: .selector,     value: "", icon: "chevron.down", order: 4),
    SignupTableViewCellModel(title: "placeholder.password",   inputType: .password,     value: "", icon: "eye.fill", order: 5),
    SignupTableViewCellModel(title: "placeholder.confirm_pw", inputType: .password,     value: "", icon: "eye.fill", order: 6)
]

func getSignupTableCellModel() -> [SignupTableViewCellModel] {
    return signupTableCellModel.sorted { $0.order < $1.order }
}

private var signupWithProvidersTableCellModel = [
    SignupTableViewCellModel(title: "placeholder.name",       inputType: .textfield,     value: "", locked: true, order: 0),
    SignupTableViewCellModel(title: "placeholder.nickname",   inputType: .textfield,     value: "", optional: true, order: 1),
    SignupTableViewCellModel(title: "placeholder.email",      inputType: .email,         value: "", locked: true, order: 2),
    SignupTableViewCellModel(title: "placeholder.dob",        inputType: .dateSelector,  value: "", icon: "calendar", order: 3),
    SignupTableViewCellModel(title: "placeholder.occupation", inputType: .selector,      value: "", icon: "chevron.down", order: 4)
]

func getSignupWithProvidersTableCellModel() -> [SignupTableViewCellModel] {
    return signupWithProvidersTableCellModel.sorted { $0.order < $1.order }
}

let occupations = ["Artist", "Business Analyst", "Construction Worker", "Desiger", "Entrepreneur", "Freelancer", "Social Worker", "Physicians", "Nurses", "Veterinarians", "Schoolteachers", "College Professors", "Lecturers", "Aeronautic Engineer", "Mechanical Engineer", "Chemical Engineer", "Software Engineer", "Accountant", "General Worker"]

let dateFormatForView = "MMM d, yyyy"
let dateFormatForAPI  = "yyyy-MM-dd"

/*
 Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
 09/12/2018                        --> MM/dd/yyyy
 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
 Sep 12, 2:11 PM                   --> MMM d, h:mm a
 September 2018                    --> MMMM yyyy
 Sep 12, 2018                      --> MMM d, yyyy
 Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
 12.09.18                          --> dd.MM.yy
 10:41:02.112                      --> HH:mm:ss.SSS
 */
 
