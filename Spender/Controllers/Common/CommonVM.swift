//
//  CommonVM.swift
//  Spender
//
//  Created by Tyler on 19/06/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Moya

final class CommonVM : NSObject {
    static let shared = CommonVM()
    
    
    //    func getAppConfig() {
    //        let provider = MoyaProvider<API.AppConfig>()
    //        debugPrint("API call startingllllllll")
    //        provider.request(.info) { result in
    //            debugPrint("Means we get the data.")
    //            switch result {
    //            case .success(let response):
    //
    //                debugPrint(try! response.mapJSON())
    //            case .failure(let error):
    //                debugPrint(error.localizedDescription)
    //                break
    //            }
    //    }
    //}
    
    func sendFeedback() {
        API.Feedback.send(name: "Tyler", rating: 5, message: "Ok Testing,")
            .requestAPI().subscribe { response in
            debugPrint(response.statusCode)
        } onFailure: { error in
            debugPrint(error.localizedDescription)
        } onDisposed: {
            DisposeBag()
        }
    }
    
    func getAppConfig() {
        
//        API.AppConfig.info.requestAPI().subscribe(onNext: { res in
//            debugPrint("⚙️⚙️⚙️⚙️---------",res.localizedDescription)
//
//        )}.disposed(by: DisposeBag())
        
        API.AppConfig.info.requestAPI().subscribe { response in
            debugPrint(response.statusCode)
        } onFailure: { error in
            debugPrint(error.localizedDescription)
        } onDisposed: {
            DisposeBag()
        }
//
//
        
       

//        { result in
//            debugPrint(result.debugDescription)
//        } onError: { error in
//            debugPrint(error.localizedDescription)
//        }


        
    }
    
}

struct OnboardingStruct {
    var image: String
    var title: String
    var subtitle: String
}
