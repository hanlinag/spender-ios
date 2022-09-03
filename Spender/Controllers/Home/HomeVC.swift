//
//  HomeViewController.swift
//  Spender
//
//  Created by Tyler on 19/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class HomeVC: SpenderViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeCardCell.nib(), forCellReuseIdentifier: HomeCardCell.identifier)
        tableView.register(HomeMiddleCell.nib(), forCellReuseIdentifier: HomeMiddleCell.identifier)
        tableView.register(HomeFooterCell.nib(), forCellReuseIdentifier: HomeFooterCell.identifier)
        
    }
    
}

//MARK: - Table View Delegate and Datasource
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCardCell.identifier, for: indexPath) as! HomeCardCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeMiddleCell.identifier, for: indexPath) as! HomeMiddleCell
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeFooterCell.identifier, for: indexPath) as! HomeFooterCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCardCell.identifier, for: indexPath) as! HomeCardCell
            
            return cell
        }//end of switch
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return self.view.frame.size.height * 0.30
        case 1:
            return self.view.frame.size.height * 0.2
        case 2:
            //return self.view.frame.size.height * 0.65
            return CGFloat((self.view.frame.size.height * 0.06 * 14))
        default:
            return 0
            
        }
    }
    
}
