//
//  SplashScreenController.swift
//  Spender
//
//  Created by Tyler on 18/12/2021.
//

import Foundation
import UIKit


class SplashScreenController: UIViewController{
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GOOO: splash screen")
        //self.perform(#selector(self.goToLoginScreen), with: nil, afterDelay: 5.0)
        goToLoginScreen()
    }
    
    @objc func goToLoginScreen(){
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewBoard") as! LoginViewController
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = vc
        //self.presentedViewController(vc, animated: true)
        
        
    
    }
}
