//
//  Congratulations.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class Congratulations: SpenderViewController {
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var btnGetStarted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func onGetStartedTapped(_ sender: Any) {
        //pop back to main
        self.view.window!.rootViewController?.dismiss(animated: true)
    }
    
    
}
