//
//  LoginViewController.swift
//  Spender
//
//  Created by Tyler on 18/12/2021.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth
import FBSDKLoginKit

class LoginViewController: UIViewController{
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GOOO: login view now")
        
        onTapToDismissKeyboard()
        
        
    }
    
    
    @IBAction func onLoginButtonAction(_ sender: Any) {
        print("GOOO: Login Button touched...")
        
        //go to tab bar controller aka main
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBarBoard") as! MainTabBarViewController
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = vc
        
    }
    
    @IBAction func onGoogleLoginAction(_ sender: Any) {
        print("GOOO: Google Login Button touched...")
        
        guard let clientID = FirebaseApp.app()?.options.clientID else {return}
        
        //google sign in config obj
        let config = GIDConfiguration(clientID: clientID)
        
        //start sign in flow
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) {[unowned self] user , error  in
            if let error = error {
                print("GOOO: GIDSignIn, error occured.. \(error.localizedDescription)")
                return
            }
            
            guard let authentication = user?.authentication else { return }
            guard let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            //get the account and do the rest
            print("GOOO: Hello, \(Auth.auth().currentUser?.displayName)")
            
        }//end of google signin
        
        
        
    }//end of button tap action
    
    @IBAction func onFacebookLoginTap(_ sender: Any) {
        print("Facebook login tapped")
        //let loginButton = FBLoginButton()
        //loginButton.delegate = self
        
        
        
    }//end of Facebook button tap action
    

    
    @IBAction func onAppleLoginTapped(_ sender: Any) {
        print("Apple login tapped")
        
    }//end of Apple login tap action
    
    
}
