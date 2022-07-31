//
//  AppConfigAPI.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import RxSwift
import RxCocoa
import RxAlamofire

extension API.AppConfig {
    
    struct GetAppConfig {
        typealias T = AppConfigResponse
        var path: String { return "app-config" }
        
        func getAppConfig() {
            URLSession.shared.rx.json(url: URL(string: "https://spendergo.herokuapp.com/api/v1/app-config")!)
                .observe(on: MainScheduler.instance)
                .subscribe{ print($0) }
            
        }
    }
    
   
}
