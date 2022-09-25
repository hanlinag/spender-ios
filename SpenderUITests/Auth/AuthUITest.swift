//
//  AuthUITest.swift
//  SpenderUITests
//
//  Created by Tyler on 25/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import XCTest
@testable import Spender

class AuthFlowUITest: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testShouldShowForgetPwPageAfterTap() {
        
        app.buttons["buttonForgotPasword"].tap()
        
        XCUIApplication().buttons["buttonSigin"].swipeDown()
        
        XCTAssertEqual(app.staticTexts["Forgot Password"].label, "Forgot Password")
    }
}

