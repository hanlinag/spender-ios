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
import SafariServices

//MARK: - Keyboard dismissal on tap
extension UIViewController {
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

//MARK: - Safari Service Invoker
extension UIViewController {
    func loadSafariView(with link: String) {
        guard let url = URL(string: link) else { return }
        
        // Present SFSafariViewController
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
}

//MARK: - Alert
extension UIViewController {
    func showAlert(title: String, subtitle: String, type: SpenderAlertType = .normal, showSecondary: Bool = true, secondaryLabel: String? = nil, primaryLabel: String, secondaryAction: (() -> ())?, primaryAction: (() -> ())?) {
        
        let config = AlertConfig(
            title: title,
            subtitle: subtitle,
            type: type,
            showSecondary: showSecondary,
            secondaryLabel: secondaryLabel,
            primaryLabel: primaryLabel,
            secondaryAction: secondaryAction,
            primaryAction: primaryAction)
        
        
        let storyboard = UIStoryboard(name: "ConfirmAlert", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConfirmAlert") as! ConfirmAlertVC
        vc.config = config
        vc.modalTransitionStyle     = .crossDissolve
        vc.modalPresentationStyle   = .overCurrentContext
        self.present(vc, animated: true)
    }
}
