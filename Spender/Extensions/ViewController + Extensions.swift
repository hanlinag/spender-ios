//
//  UIViewController + Extensions.swift
//  Spender
//
//  Created by Tyler on 19/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

extension UIViewController {
    //Keyboard dismissal on tap
    func onTapToDismissKeyboard(cancelsTouchesInView: Bool = false) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = cancelsTouchesInView
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController: LoginButtonDelegate {
    public func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard error == nil, let accessToken = result?.token else{
            return print(error ?? "Facebook access token is nil")
        }

    }
    
    public func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logged out")
    }
}
