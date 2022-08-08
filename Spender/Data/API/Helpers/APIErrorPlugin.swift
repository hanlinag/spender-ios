//
//  APIPlugin.swift
//  Spender
//
//  Created by Tyler on 02/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya

/// This class will act like the interceptor for all API calls. If the status code is within acceptable range, it will let the program pass.
/// Otherwise, we'll do the global error handling here.

final class APIErrorPlugin: PluginType {
    static let instance = APIErrorPlugin()
    
    func willSend(_ request: RequestType, target: TargetType) {
        debugPrint("Inside error plugin")
        #if DEBUG
        debugPrint("Will Send Request: ", request.request?.url?.absoluteString ?? "")
        
        if let body = request.request?.httpBody {
            debugPrint("JSON Body: \n \(try! JSONEncoder().encode(body))")
        }
        #endif
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            #if DEBUG
            
            do {
                debugPrint("URL - \(target.baseURL)\(target.path)")
                let json = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                debugPrint("API Response: Status Code \(response.statusCode) \n \(String(describing: json))")
            } catch  {
                let res = String(data: response.data, encoding: .utf8)
                debugPrint("API Response: Status Code \(response.statusCode) \n \(String(describing: res))")
            }
            
            #endif
            
            //MARK: - Handle Error Codes
            guard !(200...299 ~= response.statusCode) else { return }
            
            if response.statusCode == 403 || response.statusCode == 401 {
                //unauthorized, so clear data and logged out
                AuthVM.shared.clearAuthInfo()
                API.Headers.clearAll()
            }
            debugPrint("API Error: \(response.data)")
            break
        case .failure(let error):
            #if DEBUG
            debugPrint("API Response: Status Code \(error.response?.statusCode ?? -11)")
            #endif
            //TO DO: Show Alert of something if error occurs.
            break
        
        }
        
        
        
        #if DEBUG
        debugPrint("Global handler exits here.")
        #endif
    }
}
