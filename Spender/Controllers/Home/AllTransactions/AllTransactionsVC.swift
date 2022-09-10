//
//  AllTransactions.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class AllTransactionsVC: SpenderViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TransactionHeaderCell.nib(), forCellReuseIdentifier: TransactionHeaderCell.identifier)
        tableView.register(TransactionTableViewCell.nib(), forCellReuseIdentifier: TransactionTableViewCell.identifier)
        
        tableView.showsVerticalScrollIndicator = false
    }
    
    
}

//MARK: - UITableView Delegate and Datasource
extension AllTransactionsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TransactionHeaderCell.identifier, for: indexPath) as! TransactionHeaderCell
            
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
            
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.width * 0.5
        } else {
            return self.view.frame.size.height * 0.07
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = getViewControllerFromInstantiateStoryboard(for: .TransactionDetail) as! TransactionDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
