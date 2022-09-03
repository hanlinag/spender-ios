//
//  HomeFooterCell.swift
//  Spender
//
//  Created by Tyler on 02/09/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class HomeFooterCell: UITableViewCell {

    @IBOutlet weak var lblTransactions: UILabel!
    @IBOutlet weak var lblSeeAll: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.nib(), forCellReuseIdentifier: TransactionTableViewCell.identifier)
        
    }

    static var identifier = "HomeFooterCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeFooterCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: - DataSource and Delegate
extension HomeFooterCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        
        return cell
    }
    
    
}
