//
//  AuthValidators.swift
//  SpenderTests
//
//  Created by Tyler on 25/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import XCTest
@testable import Spender

class AuthValidatorsTest: XCTestCase {
    
    func testEmailFormatIsValid() throws {
        /* Length Check */
        XCTAssertTrue(EmailValidator().lengthIsValid(email: "test@mail.com"))
        
        XCTAssertFalse(EmailValidator().lengthIsValid(email: "a@ail.com"))
        
        /* Format Check */
        XCTAssertFalse(EmailValidator().formatIsValid(email: "jwsdlsfja;"))
        
        XCTAssertFalse(EmailValidator().formatIsValid(email: "sase@mail99"))
        
        XCTAssertTrue(EmailValidator().formatIsValid(email: "sasasa@mail.com"))
    }
    
    func testPasswordFormatValid() throws {
        /* Length Check */
        XCTAssertFalse(PasswordValidator().lengthIsValid(password: "1111"), "Password length -> 4 is failed")
        
        XCTAssertFalse(PasswordValidator().lengthIsValid(password: "111111111111111111111"), "Password length -> 21 is failed")
        
        XCTAssertTrue(PasswordValidator().lengthIsValid(password: "11111111"), "Password length -> = 8 is failed")
        
        XCTAssertTrue(PasswordValidator().lengthIsValid(password: "11111111111111111111"), "Password length -> 20 is failed")
        
        XCTAssertTrue(PasswordValidator().lengthIsValid(password: "1111111111111111111"), "Password length -> 19 is failed")
        
        /* Format Check */
        XCTAssertFalse(PasswordValidator().formatIsValid(password: "sslalek!2"), "Password format -> missing capital char is failed")
        
        XCTAssertFalse(PasswordValidator().formatIsValid(password: "Sslalek2"), "Password format -> missing special char is failed")
        
        XCTAssertFalse(PasswordValidator().formatIsValid(password: "sslAlek!@"), "Password format -> missing number is failed")
        
        XCTAssertTrue(PasswordValidator().formatIsValid(password: "Sslalek!2"), "Password format -> correct format is failed")
        
    }
    
//    func testEmailEmpty() {
//
//    }
//
//    func testPasswordEmpty() {
//
//    }
}


