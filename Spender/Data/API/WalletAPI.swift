//
//  WalletAPI.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya

extension API.Wallet : TargetType {
    private static let wallet = "wallet/"
    
    var baseURL: URL { return API.backendURL }
    
    var path: String {
        switch self {
        case .getAll:                                                      return   "wallets"
        case .create:                                                      return   "\(API.Wallet.wallet)"
        case .getBy(let uuid), .update(let uuid, _, _), .delete(let uuid): return   "\(API.Wallet.wallet)\(uuid)"
    
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .create, .update :   return .post
        case .getAll, .getBy  :   return .get
        case .delete          :   return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .create(name, type, amount):
            return .requestParameters(parameters: ["name": name, "type": type, "amount": amount], encoding: URLEncoding.default)
        case let  .update(_, name, type):
            return .requestParameters(parameters: ["name": name, "type": type], encoding: URLEncoding.default)
        case .getAll, .getBy, .delete:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return API.Headers.all()
    }
    
}
