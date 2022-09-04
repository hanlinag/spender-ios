//
//  ChangePasswordVC.swift
//  Spender
//
//  Created by Tyler on 04/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class ChangePasswordVC: SpenderViewController {

    @IBOutlet weak var textFieldCurrentPassword: UITextField!
    @IBOutlet weak var textFieldNewPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func buttonChangeDidPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK: - TextField Delegate
extension ChangePasswordVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
