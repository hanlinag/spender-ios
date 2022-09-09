//
//  WalletResponse.swift
//  Spender
//
//  Created by Tyler on 19/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

struct WalletResponse: Codable {
    var statusCode:     Int
    var description:    String
    var timestamp:      String
    var error:          ErrorResponse?
    var data:           AppConfig?
}

struct WalletData: Codable {
    var id:                     Int
    var createdAt:              String
    var updatedAt:              String
    var deletedAt:              String
    var dataId:                 String
    var iosMinVersion:          String
    var iosLatestVersion:       String
    var androidMinVersion:      String
    var androidLatestVersion:   String
}


