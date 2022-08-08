//
//  Moya + Provider.swift
//  Spender
//
//  Created by Tyler on 08/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import RxSwift

extension MoyaProvider {
    
    final func getEndpointClosure(target: Target) -> Endpoint {
        return Endpoint(
            url: URL(target: target).absoluteString,
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers)
    }
    
    
    final func requestClosure(endpoint: Endpoint, closure: RequestResultClosure) {
        do {
            let urlRequest = try endpoint.urlRequest()
            closure(.success(urlRequest))
        } catch MoyaError.requestMapping(let url) {
            closure(.failure(MoyaError.requestMapping(url)))
        } catch MoyaError.parameterEncoding(let error) {
            closure(.failure(MoyaError.parameterEncoding(error)))
        } catch {
            closure(.failure(MoyaError.underlying(error, nil)))
        }
    }
    
    
    final class func getAlamofireSession() -> Alamofire.Session {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = Alamofire.Session.default.sessionConfiguration.httpAdditionalHeaders
        
        return Alamofire.Session(configuration: config, startRequestsImmediately: false)
    }
}


extension TargetType {
    func requestAPI() -> RxSwift.Single<Moya.Response> {
        return SpenderProviderRequest(self)
    }
    
    private func SpenderProviderRequest<T: TargetType>(_ target: T) -> RxSwift.Single<Moya.Response> {
        let provider = MoyaProvider<T>.defaultProvider()
        //debugPrint("provider createdd.........\(target.requestAPI())")
       
        return provider.request(target)
            
    }
}
