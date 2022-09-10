//
//  TransactionDetail.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class TransactionDetailVC: SpenderViewController {
    
    lazy var lblNavTitle: UILabel = {
        let title = UILabel()
        title.text = "Wallet Name"
        title.font = .systemFont(ofSize: 14.0)
        title.textColor = .black
        title.textAlignment = .center
        
        return title
    }()
    
    lazy var lblNavAmount: UILabel = {
        let title = UILabel()
        title.text = "Sept 4, 2022 • 08:34 PM"
        title.font = .systemFont(ofSize: 12.0, weight: .light)
        title.textColor = .black.withAlphaComponent(0.7)
        title.textAlignment = .center
        
        return title
    }()
    
    lazy var customNav: UIStackView = {
        let nav = UIStackView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        
        nav.axis = .vertical
        nav.alignment = .center
        nav.distribution = .fillProportionally
        nav.addArrangedSubview(lblNavTitle)
        nav.addArrangedSubview(lblNavAmount)
        
        return nav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.titleView = customNav
        
        
    }
    
    @IBAction func buttonDeleteDidPress(_ sender: Any) {
        self.showAlert(title: "Confirmation", subtitle: "Are you sure you want to delete this transaction?", primaryLabel: "Delete", secondaryAction: {}, primaryAction: {})
    }
    
    
    @IBAction func buttonEditDidPress(_ sender: Any) {
    }
    
    
}
