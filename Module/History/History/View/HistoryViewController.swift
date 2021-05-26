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
        
        self.presenter?.loadHistoryThisWeek()
        self.presenter?.loadHistoryThisMonth()
    }
    
    func setupTabView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        
        self.tableView.dataSource = self.dataSource
        self.tableView.sectionIndexBackgroundColor = .none
    }
    
    @IBAction func backToHomeAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome(viewController: self)
    }
}

extension HistoryViewController: HistoryView {
    func showHistoryThisWeek(historiesThisWeek: [TransactionEntity]) {
        self.dataSource.historyThisWeek = historiesThisWeek
        self.tableView.reloadData()
    }
    func showHistoryThisMonth(historiesThisMonth: [TransactionEntity]) {
        self.dataSource.historyThisMonth = historiesThisMonth
        self.tableView.reloadData()
    }
}
