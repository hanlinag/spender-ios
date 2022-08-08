//
//  API.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import UIKit
import Moya
import Alamofire

protocol ParametersInURL {}
protocol CachePolicyGettableType { var cachePolicy: URLRequest.CachePolicy? { get } }


//MARK: - API Values
enum API {
    enum Auth {}
    enum Wallet {}
    enum Transaction {}
    enum AppConfig {
        case info
    }
    enum Feedback {}
    
    enum Headers {}
    
    static var backendURL: URL {
        return URL(string: "https://spendergo.herokuapp.com/api/v1/")!
    }
    
    static var exchangeRateURL: URL {
        return URL(string: "https://forex.cbm.gov.mm/api/latest")!
    }
    
    static var strapiURL: URL {
        return URL(string: "https://mycms.com")!
    }
}

//MARK: - MOYA
extension Moya.TargetType {
    var backendURL: URL             { return API.backendURL }
    var exchangeRateURL: URL        { return API.exchangeRateURL }
    var strapiURL: URL              { return API.strapiURL }
    var headers: [String: String]?  { return API.Headers.all() }
}

//MARK: - Moya For Actual API Call Config
extension MoyaProvider {
    
    
    static func defaultProvider() -> SpenderProvider<Target> {
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 90
        config.timeoutIntervalForResource = 90
        config.urlCache = nil
        
        let session = Alamofire.Session(configuration: config)
        
        return SpenderProvider(endpointClosure: { target in
            return MoyaProvider.defaultEndpointMapping(for: target)
        }, session: session, plugins: [APIErrorPlugin.instance])
    }
}


//MARK: - API Manager Cachingn Policies
extension API: CachePolicyGettableType {
    var cachePolicy: URLRequest.CachePolicy? { .reloadIgnoringLocalCacheData }
}



//MARK: - Strig Helper for API
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data { Data(self.utf8) }
}
