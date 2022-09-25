//
//  AuthValidators.swift
//  Spender
//
//  Created by Tyler on 25/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

struct EmailValidator {
    
    func lengthIsValid(email: String) -> Bool {
        return email.count > 9
    }
    
    func formatIsValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
    }
    
}

struct PasswordValidator {
    
    func lengthIsValid(password: String) -> Bool {
        return password.count >= 8 && password.count <= 20
    }
    
    /* One Capital char, One small char, one num, one special character */
    func formatIsValid(password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,20}"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        return predicate.evaluate(with: password)
    }
    
    
}
