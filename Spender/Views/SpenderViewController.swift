//
//  SpenderViewController.swift
//  Spender
//
//  Created by Tyler on 31/07/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

////Parent UIViewController of the whole application. Custom config methods will be under this file.
///

import Foundation
import UIKit

class SpenderViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set locale
        Locale.currentLocale = Locale(rawValue: UserDefaultsUtils.currentLocale!) ?? .EN
        
        //tap to dismiss kb in every screen
        onTapToDismissKeyboard()
        
    }
}
