//
//  TransactionAPI.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya

extension API.Transaction : TargetType {
    private static let transaction = "transaction/"
    
    var baseURL: URL { return API.backendURL }
    
    var path: String {
        switch self {
        case .getAll, .getByQuery:                                          return   "transactions"
        case .create :                                                      return   "\(API.Transaction.transaction)"
        case .getBy(let uuid), .update(let uuid, _, _, _, _, _, _, _), .delete(let uuid):
            return   "\(API.Transaction.transaction)\(uuid)"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .create, .update              :   return .post
        case .getAll, .getBy, .getByQuery  :   return .get
        case .delete                       :   return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .create(title, walletID, amount, category, type, note, date):
            return .requestParameters(parameters: ["title": title, "wallet_id": walletID, "amount": amount, "category": category, "type": type, "note": note,"date": date], encoding: URLEncoding.default)
        case let  .update(_, title, walletID, amount, category, type, note, date):
            return .requestParameters(parameters: ["title": title, "wallet_id": walletID, "amount": amount, "category": category, "type": type, "note": note,"date": date], encoding: URLEncoding.default)
        case let .getByQuery(walletID, type, category):
            return .requestParameters(parameters: ["wallet_id": walletID, "type": type, "category": category], encoding: URLEncoding.queryString)
        case .getAll, .getBy, .delete:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return API.Headers.all()
    }
    
}
