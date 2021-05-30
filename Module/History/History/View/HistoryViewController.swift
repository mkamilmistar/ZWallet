//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core
import NVActivityIndicatorView

class HistoryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loadingView: NVActivityIndicatorView!
    @IBOutlet var backIcon: UIImageView!
    
    var dataSource = HistoryDataSource()
    var presenter: HistoryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabView()
        
        self.presenter?.loadHistoryThisWeek()
        self.presenter?.loadHistoryThisMonth()
        
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
        self.loadingView.startAnimating()
        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
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
        DispatchQueue.main.async {
            self.dataSource.historyThisWeek = historiesThisWeek
            self.tableView.reloadData()
            self.loadingView.stopAnimating()
        }
    }
    func showHistoryThisMonth(historiesThisMonth: [TransactionEntity]) {
        DispatchQueue.main.async {
            self.dataSource.historyThisMonth = historiesThisMonth
            self.tableView.reloadData()
            self.loadingView.stopAnimating()
        }
    }
}
