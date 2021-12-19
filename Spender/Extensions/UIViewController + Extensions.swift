//
//  UIViewController + Extensions.swift
//  Spender
//
//  Created by Tyler on 19/12/2021.
//

import Foundation
import UIKit

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
