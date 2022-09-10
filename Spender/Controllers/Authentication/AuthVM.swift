//
//  AuthVM.swift
//  Spender
//
//  Created by Tyler on 19/06/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct ProfilePicture {
    let image: String
    let backgroundColor: Int
}



final class AuthVM: NSObject {
    static let shared = AuthVM()
    
    var accountStatus: String? = ""
    
    var signupMode: SignupMode = .normal //Default
    
   // var object = ObservableObject
    
    func clearAuthInfo() {
        self.accountStatus = nil
    }
    
    func loginWith(email: String?, password: String?) {
        
        if let mail = email, let pw = password {
            API.Auth.login(email: mail, password: pw, loginType: LoginType.email.rawValue)
                .requestAPI()
                .subscribe { response in
                    debugPrint(response.statusCode)
                    
                } onFailure: { error in
                    debugPrint(error.localizedDescription)
                } onDisposed: {
                    DisposeBag()
                }
        } else {
            
        }
        
    }
}
