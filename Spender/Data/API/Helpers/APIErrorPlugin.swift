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
        
        #if DEBUG
        print("⚡️⚡️⚡️ Will Send Request:⚡️⚡️⚡️ \n", request.request?.url?.absoluteString ?? "")
        
        print("⚙️⚙️⚙️ Headers ⚙️⚙️⚙️ \n", request.request?.headers.description ?? "")
        
        if let body = request.request?.httpBody {
            
            print("⚡️⚡️⚡️ JSON Body: \n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "" )") 
        }
        #endif
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            #if DEBUG
            
            do {
                print("⬇️⬇️⬇️ Response URL - \(target.baseURL)\(target.path)")
                let json = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                print("🟢🟢🟢 API Response: Status Code \(response.statusCode) \n \(String(describing: json))")
            } catch  {
                let res = String(data: response.data, encoding: .utf8)
                print("🟢🟢🟢 API Response: Status Code \(response.statusCode) \n \(String(describing: res))")
            }
            
            #endif
            
            //MARK: - Handle Error Codes
            guard !(200...299 ~= response.statusCode) else { return }
            
            if response.statusCode == 403 || response.statusCode == 401 {
                //unauthorized, so clear data and logged out
                AuthVM.shared.clearAuthInfo()
                API.Headers.clearAll()
            }
            print("🔴🔴🔴 API Error: \(response.data)")
            break
        case .failure(let error):
            #if DEBUG
            print("🔴🔴🔴 API Response: Status Code \(error.response?.statusCode ?? -11)")
            #endif
            //TO DO: Show Alert of something if error occurs.
            break
        
        }
        
        
        
        #if DEBUG
        //debugPrint("Global handler exits here.")
        #endif
    }
}
