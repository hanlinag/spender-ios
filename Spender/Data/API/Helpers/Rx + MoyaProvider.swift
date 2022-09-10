//
//  Rx + MoyaProvider.swift
//  Spender
//
//  Created by Tyler on 09/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import Alamofire
import RxRelay


public extension Reactive where Base: MoyaProviderType {
    func request(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Single<Response> {
        debugPrint("🏎🏎🏎 Inside request with Rx")
        
        
        return Single<Response>.create { single in
            
            let cancellableToken = base.request(token, callbackQueue: callbackQueue, progress: nil) { result in
                switch result {
                case let .success(response):
                    single(.success(response))
                case let .failure(error):
                    single(.failure(error))
                }
            }
               return Disposables.create {
                   cancellableToken.cancel()
               }
           }
        //return Single<Response>.create { single in
        
        
        //        return Single<Response>.create(subscribe: { single in
        //            let cancellableToken = base.request(token, callbackQueue: nil, progress: nil) { result in
        //                //perform API call
        //                switch result {
        //                case let .success(response):
        //                    single(.success(response))
        //                case let .failure(error):
        //                    single(.failure(error))
        //                }
        //
        //                 Disposables.create {
        //                    cancellableToken.cancel()
        //                }
        //            }
        //                //return Disposables.create { }
        //        }).asObservable()
        
        //                switch result {
        //                case .success(let response):
        //                    Observable.create { obs in
        //                        ob
        //                    }
        //                    obs.map
        //                    reuturn obs.asSingle()
        //
        //                    break
        //                    //single(.success(response))
        //                case .failure(let error): break
        //                    //single(.failure(error))
        //                }
        
        
        
        
        //}

//        return Single<Response>.create(subscribe: { single in
//            let cancellable = base.request(token, callbackQueue: nil, progress: nil) { result in
//                //api result
//                switch result {
//                case .success(let success):
//                    single(.success(success))
//                    break
//                case .failure(let error):
//                    single(.failure(error))
//                    break
//                }
//            }
//
//            return Disposables.create {
//                cancellable.cancel()
//            }
//        }).asObservable().asSingle()//end of create
//
//        return Single.create { single in
//            let cancellableToken = base.request(token, callbackQueue: callbackQueue, progress: nil) { result in
//                switch result {
//                case let .success(response):
//                    single(.success(response))
//                case let .failure(error):
//                    single(.failure(error))
//                }
//            }
//
//            return Disposables.create {
//                cancellableToken.cancel()
//            }
//        }
        
    }
    
}
