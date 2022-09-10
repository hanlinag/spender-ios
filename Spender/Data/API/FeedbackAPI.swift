//
//  FeedbackAPI.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya

extension API.Feedback : TargetType {
    private static let feedback = "feedback"
    
    var baseURL: URL { return API.backendURL }
    
    var path: String {
        switch self {
        case .send: return "\(API.Feedback.feedback)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .send : return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .send(name, rating, message):
            return .requestParameters(parameters: ["name": name,"rating": rating,"message": message], encoding: URLEncoding.default)
        }
    }
    
    
}
