//
//  AppConfigAPI.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import RxSwift
import RxCocoa
import RxAlamofire


extension API.AppConfig: TargetType {
    
    private static let appConfig = "app-config"
    
    var baseURL: URL { return API.backendURL }
    
    var path: String {
        switch self {
        case .info: return "\(API.AppConfig.appConfig)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .info: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .info: return .requestPlain //no parameter
        }
    }
    
    var headers: [String : String]? {
        return API.Headers.all()
    }
    
    

    
}
