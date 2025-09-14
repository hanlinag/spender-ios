//
//  AuthVM.swift
//  Spender
//
//  Created by Tyler on 19/06/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import RxSwift

struct ProfilePicture {
    let image: String
    let backgroundColor: Int
}



@MainActor
final class AuthVM: NSObject {
    static let shared = AuthVM()

    var accountStatus: String? = ""

    private let disposeBag = DisposeBag()
    
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
                }
                .disposed(by: disposeBag)
        }
    }

    func loginAsync(email: String, password: String) async throws {
        let response = try await API.Auth.login(email: email, password: password, loginType: LoginType.email.rawValue)
            .requestAPIAsync()
        debugPrint(response.statusCode)
    }
}
