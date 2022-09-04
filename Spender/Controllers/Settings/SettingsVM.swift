//
//  SettingsVM.swift
//  Spender
//
//  Created by Tyler on 19/06/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import Foundation

class SettingsVM: NSObject {
    static let shared = SettingsVM()
    
    let appSettings = [
        SettingsElement(title: "settings.edit_profile", icon: "person.crop.square.filled.and.at.rectangle"),
        SettingsElement(title: "settings.change_password", icon: "network.badge.shield.half.filled"),
        SettingsElement(title: "settings.wallet_setup", icon: "rectangle.badge.plus"),
        SettingsElement(title: "settings.change_language", icon: "character.bubble"),
        SettingsElement(title: "settings.legal_privacy", icon: "doc.append"),
        SettingsElement(title: "settings.feedback", icon: "envelope.badge")
        ]
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    
    let legalAndPrivacy = [
        LegalAndPrivacy(title: "title.terms_of_use", url: "https://deceipt.vercel.app/terms.html"),
        LegalAndPrivacy(title: "title.privacy_policy", url: "https://deceipt.vercel.app/privacy.html")
    ]
}

struct SettingsElement {
    var title: String
    var icon: String
}

struct LegalAndPrivacy {
    var title: String
    var url: String
}
