//
//  APIProvider.swift
//  Spender
//
//  Created by Tyler on 02/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Moya

class SpenderProvider<Target> where Target: Moya.TargetType {
    
    fileprivate let provider: MoyaProvider<Target>
    
    init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
         session: Session = MoyaProvider<Target>.getAlamofireSession(),
         plugins: [PluginType] = [],
         trackInflights: Bool = false) {
        
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: nil, session: session, plugins: plugins, trackInflights: trackInflights)
        
    }
    
    func request(_ t: Target) -> Single<Response> {
        debugPrint("Inside request...............")
        
        provider.request(t) { result in
           // return result
            debugPrint("hello, \(result)")
        }
        return provider.rx.request(t)
    }
    
    
    
}

