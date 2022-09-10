//
//  AlertConfig.swift
//  Spender
//
//  Created by Tyler on 31/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

struct AlertConfig {
    var title: String?
    var subtitle: String?
    var type: SpenderAlertType = .normal
    var showSecondary: Bool = true
    var secondaryLabel: String? = nil
    var primaryLabel: String?
    var secondaryAction: (() -> ())?
    var primaryAction: (() -> ())?
}
