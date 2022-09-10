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
        
        //var response : Response? = nil
        //var error : MoyaError?    = nil
       // var isSuccess: Bool      = false
        
//        provider.request(t) { result in
//            switch result {
//            case .success(let respo):
//                response = respo
//                isSuccess = true
//                break
//
//            case .failure(let err):
//                error = err
//                isSuccess = false
//                break
//            }
//        }
        
        return Single<Response>.create(subscribe: { single in
            
            let cancellable = self.provider.request(t) { result in
            switch result {
                case .success(let respo):
                    single(.success(respo))
                    break
                    
                case .failure(let err):
                    single(.failure(err))
                    break
                }
                
                //return Disposables.create { }
            }
            
//            if isSuccess {
//                single(.success(response!))
//            } else {
//                single(.failure(error!))
//            }
            
            return Disposables.create {
               // cancellable.cancel()
            }
        })
        
    }
    
    
    //            self.provider.request(t) { result in
    //                switch result {
    //                case .success(let response):
    //                    return Single.create(subscribe: { single in
    //                        single(.success(response))
    //                    })
    //
    //                case .failure(let error):
    //                    return Single.create(subscribe: { single in
    //                        single(.failure(error))
    //                    })
    //                }
    //                //single(.failure(error)) as! Disposable
    //            } as! Single<Response>
    //
    
    //  return provider.rx.reque
    
    //return provider.rx.request(t)
    
    
    //        return Disposables.create {
    //            cancellableToken?.cancel()
    //        }
    // return provider.rx.request(t)




}

