//
//  ReceiverViewController.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core
import NVActivityIndicatorView

class ReceiverViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var receiverTableView: UITableView!
    @IBOutlet var contactFoundLabel: UILabel!
    @IBOutlet var backIcon: UIImageView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var loadingView: NVActivityIndicatorView!
    
    var dataSource = ReceiverDataSource()
    
    var presenter: ReceiverPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableReceiver()
        self.presenter?.loadDataReceiver()
        
        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
        loadingView.startAnimating()
    }

    func setupTableReceiver() {
        self.dataSource.viewController = self
        
        self.receiverTableView.register(UINib(nibName: "ReceiverCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "ReceiverCell")
        
        self.receiverTableView.dataSource = self.dataSource
        self.receiverTableView.delegate = self.dataSource
        self.searchBar.delegate = self

    }
    
    @IBAction func backTapAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome(viewController: self)
    }
}

extension ReceiverViewController: ReceiverView {
    func showAllReceiver(receiverData: [ReceiverEntity]) {
        DispatchQueue.main.async {
            self.dataSource.allDataReceiver = receiverData
            self.dataSource.filteredData = receiverData
            self.contactFoundLabel.text = "\(self.dataSource.filteredData.count) Contact Found"
            self.receiverTableView.reloadData()
            self.loadingView.stopAnimating()
        }
    }
}

extension ReceiverViewController: ReceiverCellDelegate {
    func passDataTransaction(passData: ReceiverEntity) {
        self.presenter?.passingDataReceiver(viewController: self, passingData: passData)
    }
}

extension ReceiverViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.lowercased()
        self.dataSource.filteredData = self.dataSource.allDataReceiver.filter({$0.name.lowercased().hasPrefix(text)})
        self.receiverTableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        self.dataSource.filteredData = self.dataSource.allDataReceiver
        self.receiverTableView.reloadData()
    }
}
