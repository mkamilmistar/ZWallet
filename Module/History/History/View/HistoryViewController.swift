//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core

class HistoryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var dataSource = HistoryDataSource()
    
    var presenter: HistoryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabView()
        
        self.presenter?.loadHistoryTransaction()
    }
    
    func setupTabView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        
        self.tableView.dataSource = self.dataSource
    }
    
    @IBAction func logoutAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome()
    }
}

extension HistoryViewController: HistoryView {
    func showHistoryData(transactions: [TransactionEntity]) {
        self.dataSource.historyTransactions = transactions
        self.tableView.reloadData()
    }
}
