//
//  ReceiverDataSource.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

protocol ReceiverDataSourceDelegate: AnyObject {
//    func navigateToTransaction()
//    func searchBar(receiverData: [ReceiverEntity])
//    func searchBarCancelButtonClicked(receiverData: [ReceiverEntity])
    func reloadDataTable()
}

class ReceiverDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var viewController: ReceiverViewController!
    var allDataReceiver: [ReceiverEntity] = []
    lazy var filteredData = self.allDataReceiver
    
    var delegate: ReceiverDataSourceDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReceiverCell.self), for: indexPath) as! ReceiverCell
        
        cell.showDataReceiver(receiver: self.filteredData[indexPath.row])
        cell.delegate = self.viewController
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        self.filteredData = allDataReceiver.filter({$0.name.hasPrefix(searchText)})
        self.delegate?.reloadDataTable()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
//        searchBar.text = nil
        self.filteredData = self.allDataReceiver
        self.delegate?.reloadDataTable()
    }
    
}
