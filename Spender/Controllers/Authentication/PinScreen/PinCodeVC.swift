//
//  PinCode.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit
import LocalAuthentication

class PinCodeVC: SpenderViewController {
    
    //Biometric
    var context: LAContext?
    var biometry: LABiometryType?
    var error: NSError?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // If error is an instance of LAError
        context =  LAContext()
        biometry = context?.biometryType
        authenticateBiometricData()
        
    }
    
    
    func authenticateBiometricData(){
        let context = LAContext()
        context.localizedFallbackTitle = "";
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            error: &error) {
            
            // Device can use biometric authentication
            context.evaluatePolicy( LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Access requires authentication", reply: { (success, error) in
                DispatchQueue.main.async {
                    if let err = error {
                        switch err._code {
                        case LAError.Code.systemCancel.rawValue:
                            self.notifyUser("Session cancelled", err: err.localizedDescription)
                        case LAError.Code.userCancel.rawValue:
                            self.notifyUser("Please try again", err: err.localizedDescription)
                        default:
                            self.notifyUser("Authentication failed", err: err.localizedDescription)
                        }
                    } else {
                        self.dismiss(animated: true)
                        //no error
                        //pass the encrypted pin to the middleware
                        //                        self.pin1TextField.text = "1"
                        //                        self.pin2TextField.text = "5"
                        //                        self.pin3TextField.text = "1"
                        //                        self.pin4TextField.text = "5"
                        //self.performSegue(withIdentifier: self.segueIdentifier.rawValue, sender: nil)
                    }//end of else
                }
            })
            
        } else {
            // Device cannot use biometric authentication
            if let err = error {
                switch err.code {
                    
                case LAError.Code.biometryNotEnrolled.rawValue:
                    notifyUser("User is not enrolled",
                               err: err.localizedDescription)
                    
                case LAError.Code.passcodeNotSet.rawValue:
                    notifyUser("A passcode has not been set",
                               err: err.localizedDescription)
                    
                    
                case LAError.Code.biometryNotAvailable.rawValue:
                    notifyUser("Biometric authentication not available",
                               err: err.localizedDescription)
                default:
                    notifyUser("Unknown error",
                               err: err.localizedDescription)
                }
            }
        }
    }//end of biometric method
    
    func notifyUser(_ msg: String, err: String?) {
        let alert = UIAlertController(title: msg,
                                      message: err,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK".localized,
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true,
                     completion: nil)
    }
    
}
