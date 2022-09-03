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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WalletsCell.nib(), forCellReuseIdentifier: WalletsCell.identifier)
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
