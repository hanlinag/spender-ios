//
//  AppConfigResponse.swift
//  Spender
//
//  Created by Tyler on 01/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

struct AppConfigResponse {
    let statusCode:     Int?
    let description:    String?
    let timestamp:      String?
    let error:          ErrorResponse?
    let data:           AppConfig?
}

struct AppConfig {
    let id:                     Int?
    let createdAt:              String?
    let updatedAt:              String?
    let deletedAt:              String?
    let dataId:                 String?
    let iosMinVersion:          String?
    let iosLatestVersion:       String?
    let androidMinVersion:      String?
    let androidLatestVersion:   String?
}
