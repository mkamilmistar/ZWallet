//
//  ReceiverViewController.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core

class ReceiverViewController: UIViewController {
    
    @IBOutlet var receiverTableView: UITableView!
    
    var dataSource = ReceiverDataSource()
    
    var presenter: ReceiverPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableReceiver()
        self.presenter?.loadDataReceiver()
    }

    func setupTableReceiver() {
        self.dataSource.viewController = self
        
        self.receiverTableView.register(UINib(nibName: "ReceiverCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "ReceiverCell")
        
        self.receiverTableView.dataSource = self.dataSource
    }
    
    @IBAction func backTapAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome(viewController: self)
    }
    
}

extension ReceiverViewController: ReceiverView {
    func showAllReceiver(receiverData: [ReceiverEntity]) {
        self.dataSource.allDataReceiver = receiverData
        self.receiverTableView.reloadData()
    }
}
