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

    func requestAsync(_ target: Target) async throws -> Response {
        return try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}


extension TargetType {
    func requestAPI() -> RxSwift.Single<Moya.Response> {
        return SpenderProviderRequest(self)
    }

    func requestAPIAsync() async throws -> Moya.Response {
        let provider = MoyaProvider<Self>.defaultProvider()
        return try await provider.requestAsync(self)
    }
    
    private func SpenderProviderRequest<T: TargetType>(_ target: T) -> RxSwift.Single<Moya.Response> {
        let provider = MoyaProvider<T>.defaultProvider()

        return provider.request(target)

    }
}
