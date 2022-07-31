//
//  HomeViewController.swift
//  Spender
//
//  Created by Tyler on 19/12/2021.
//  Copyright © 2022 Tyler. All rights reserved.
//

import UIKit

class HomeViewController: SpenderViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet var transactionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //register nib for table view
        transactionTableView.register(TransactionTableViewCell.nib(), forCellReuseIdentifier: TransactionTableViewCell.identifier)
        
        print("GOOO: Home View controller now")
        // Do any additional setup after loading the view.
        
        //configure naviation controller
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        //self.navigationController?.navigationBar.title = "Hello"
        
        mainScrollView.delegate = self
        mainScrollView.isScrollEnabled = true
        
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        transactionTableView.isScrollEnabled = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionTableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        
        cell.configure(image: "moon", title: "Hello Custom", date: "Today, 12:00 AM", amount: "6700")
        return cell 
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }

}
