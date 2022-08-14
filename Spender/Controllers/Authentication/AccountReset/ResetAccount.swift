//
//  AccountResetMainVC.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit

class ResetAccount: SpenderViewController {
    
    @IBOutlet weak var imgbackground: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    //Pinn
    @IBOutlet weak var pinView: UIStackView!
    @IBOutlet weak var tfOne: UITextField!
    @IBOutlet weak var tfTwo: UITextField!
    @IBOutlet weak var tfThree: UITextField!
    @IBOutlet weak var tfFour: UITextField!
    
    //Password
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPasswordConfirm: UITextField!
    
    //Buttons
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnResend: UIButton!
    
    private var currentStep = 1
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        //set up nav left bar item
        let leftNavButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(handleBackAction))
        leftNavButton.tintColor = .black
        self.navigationItem.hidesBackButton   = false
        self.navigationItem.leftBarButtonItem = leftNavButton
    }
    
    
    func setup() {
        switch currentStep {
        case 1:
            setupLabelsFor(title: "title.forgot_pw", desc: "desc.forgot_pw", button: "btn.send")
            
            tfEmail.isHidden            = false
            tfPassword.isHidden         = true
            tfPasswordConfirm.isHidden  = true
            
            pinView.isHidden            = true
            btnResend.isHidden          = true
            break
        case 2:
            setupLabelsFor(title: "title.confirmation", desc: "desc.confirmation", button: "btn.reset")
            
            tfEmail.isHidden            = true
            tfPassword.isHidden         = true
            tfPasswordConfirm.isHidden  = true
            
            pinView.isHidden            = false
            btnResend.isHidden          = false
            break
        case 3:
            setupLabelsFor(title: "title.set_new_pw", desc: "desc.set_new_pw", button: "btn.confirm")
            
            tfEmail.isHidden            = true
            tfPassword.isHidden         = false
            tfPasswordConfirm.isHidden  = false
            
            pinView.isHidden            = true
            btnResend.isHidden          = true
            break
        default:
            setupLabelsFor(title: "title.forgot_pw", desc: "desc.forgot_pw", button: "btn.send")
            
            tfEmail.isHidden            = false
            tfPassword.isHidden         = true
            tfPasswordConfirm.isHidden  = true
            
            pinView.isHidden            = true
            btnResend.isHidden          = true
        }
    }
    
    
    
    //MARK: - Private Methods
    private func setupLabelsFor(title: String, desc: String, button: String) {
        lblTitle.localizedText = title
        lblDesc.localizedText  = desc
        btnSend.localizedTitle = button
    }
    
    
    @objc private func handleBackAction() {
        switch currentStep {
        case 1:
            self.dismiss(animated: true)
            break
        case 2:
            currentStep = 1
            setup()
            break
        case 3:
            currentStep = 2
            setup()
            break
        default:
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func onSendTapped(_ sender: Any) {
        switch currentStep {
        case 1:
            //send action
            currentStep = 2
            setup()
            break
        case 2:
            //reset action
            currentStep = 3
            setup()
            break
        case 3:
            //confirm action
            //check and go to congrats
            goToCongratsScreen()
            break
        default:
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func onResendTapped(_ sender: Any) {
        debugPrint("On Resend OTP Tapped")
    }
    
    private func goToCongratsScreen() {
        let storyboard = UIStoryboard(name: "Congratulations", bundle: Bundle.main)
        let vc: Congratulations = storyboard.instantiateViewController(withIdentifier: "Congratulations") as! Congratulations
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle   = .crossDissolve
        vc.isModalInPresentation  = false
        
        self.present(vc, animated: true)
    }
    
}
