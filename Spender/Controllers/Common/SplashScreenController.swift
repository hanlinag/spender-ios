//
//  SplashScreenController.swift
//  Spender
//
//  Created by Tyler on 18/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit


class SplashScreenController: SpenderViewController{
    
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
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginVC
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = vc
        //self.presentedViewController(vc, animated: true)
        
        
    
    }
}
