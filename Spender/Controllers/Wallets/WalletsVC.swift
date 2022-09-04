//
//  WalletsViewController.swift
//  Spender
//
//  Created by Tyler on 19/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class WalletsVC: SpenderViewController {
    
    @IBOutlet weak var imgIncome: UIImageView!
    @IBOutlet weak var lblIncome: UILabel!
    
    @IBOutlet weak var lblOutcome: UILabel!
    @IBOutlet weak var imgOutcome: UIImageView!
    
    @IBOutlet weak var lblMyWallets: UILabel!
    @IBOutlet weak var btnAddTransaction: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    //    lazy var customNavBar: SpenderNavBar = {
    //        let nav = SpenderNavBar(frame: self.navigationController?.navigationBar.frame ?? CGRect(x: 0, y: 0, width: 200, height: 45))
    //
    //        return nav
    //    }()
    lazy var lblNavTitle: UILabel = {
        let title = UILabel()
        title.text = "title.total_wealth".localized
        title.font = .systemFont(ofSize: 13.0)
        title.textAlignment = .center
        
        return title
    }()
    
    lazy var lblNavAmount: UILabel = {
        let title = UILabel()
        title.text = "00000.00 MMK"
        title.font = .systemFont(ofSize: 18.0, weight: .medium)
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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WalletsCell.nib(), forCellReuseIdentifier: WalletsCell.identifier)
    }
    
    @IBAction func buttonAddTransactionDidTap(_ sender: Any) {
        let vc = getViewControllerFromInstantiateStoryboard(for: .AllTransactions) as! AllTransactionsVC
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

//MARK: - TableViewDelegate, TableViewDataSource
extension WalletsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WalletsCell.identifier, for: indexPath) as! WalletsCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.view.frame.height * 0.067)
    }
    
}
