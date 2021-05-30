//
//  TopUpViewController.swift
//  TopUp
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core

class TopUpViewController: UIViewController {

    @IBOutlet var topUpTableView: UITableView!
    @IBOutlet var backIcon: UIImageView!
    
    var presenter: TopUpPresenter?
    var dataSource = TopUpDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        self.setupTableView()
    }
    
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.topUpTableView.register(UINib(nibName: "TopUpViewCell", bundle: Bundle(identifier: "com.casestudy.TopUp")), forCellReuseIdentifier: "TopUpViewCell")
        self.topUpTableView.register(UINib(nibName: "HeaderViewCell", bundle: Bundle(identifier: "com.casestudy.TopUp")), forCellReuseIdentifier: "HeaderViewCell")
        
        self.topUpTableView.dataSource = self.dataSource
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome(viewController: self)
    }
}

extension TopUpViewController: TopUpView {
    func showHeader() {
        //
    }
    
    func showDataTopUp(topUpData: [TopUpEntity]) {
        self.dataSource.topUpData = topUpData
        self.topUpTableView.reloadData()
    }
}
