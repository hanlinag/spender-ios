//
//  AuthAPI.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya

extension API.Auth: TargetType {
    private static let auth = "auth/"
    
    var baseURL: URL { return API.backendURL }
    
    var path: String {
        switch self {
        case .login:    return "\(API.Auth.auth)login"
        case .signup:   return "\(API.Auth.auth)signup"
        case .logout:   return "\(API.Auth.auth)logout"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:    return .get
        case .signup:   return .post
        case .logout:   return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .login(email, password, loginType):
            return .requestParameters(parameters: ["email": email, "password": password, "login_type": loginType ], encoding: URLEncoding.default)
        case let .signup(name, email, nickName, password, dob, loginType, occupation):
            return .requestParameters(parameters: ["name": name, "email": email, "nick_name": nickName, "password": password, "dob": dob, "login_type": loginType, "occupation": occupation], encoding: URLEncoding.default)
        case .logout:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        return API.Headers.all()
    }
    
}
