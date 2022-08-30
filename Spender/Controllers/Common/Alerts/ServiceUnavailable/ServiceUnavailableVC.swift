//
//  ServiceUnavailableVC.swift
//  Spender
//
//  Created by Tyler on 30/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class ServiceUnavailableVC: UIViewController {
    
    @IBOutlet weak var floatingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func okButtonDidPress(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
