//
//  WalletSetup.swift
//  Spender
//
//  Created by Tyler on 14/08/2022.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class WalletSetupVC: SpenderViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonCreate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WalletsCell.nib(), forCellReuseIdentifier: WalletsCell.identifier)
    }
    @IBAction func buttonCreateWalletDidPress(_ sender: Any) {
        let vc = getViewControllerFromInstantiateStoryboard(for: .CreateNewWallet) as! CreateNewWalletVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - UITableView Delegate, Datasource
extension WalletSetupVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WalletsCell.identifier, for: indexPath)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.2
    }
}
