//
//  HomeViewController.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Core
import NVActivityIndicatorView

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var loading: NVActivityIndicatorView!

    var dataSource = HomeDataSource()
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        
        self.loading.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loading.type = .ballRotateChase
        loading.startAnimating()
        
    }
    
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "DashboardCell", bundle: Bundle(identifier: "com.casestudy.Home")), forCellReuseIdentifier: "DashboardCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        self.tableView.register(UINib(nibName: "NotFoundCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "NotFoundCell")
        
        self.tableView.dataSource = self.dataSource
        self.presenter?.loadProfile()
        self.presenter?.loadTransaction()
    }
}

extension HomeViewController: DashboardCellDelegate {
    func showTopUp() {
        self.presenter?.showTopUp(viewController: self)
    }
    
    func showAllReceiver() {
        self.presenter?.showReceiver(viewControoller: self)
    }
    
    func showAllTransaction() {
        self.presenter?.showHistory(viewController: self)
    }
    
    func logout() {
        self.presenter?.logout()
    }
}

extension HomeViewController: HomeView {
    func showUserProfileData(userProfile: UserProfileEntity) {
        DispatchQueue.main.async {
            self.dataSource.userProfile = userProfile
            self.tableView.reloadData()
            self.loading.stopAnimating()
        }
    }
    
    func showTransactionData(transactions: [TransactionEntity]) {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            self.dataSource.transactions = transactions
            self.tableView.reloadData()
            self.loading.stopAnimating()
        }
    }
}
