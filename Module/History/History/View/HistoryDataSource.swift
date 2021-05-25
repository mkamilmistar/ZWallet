//
//  HistoryDataSource.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryDataSource: NSObject, UITableViewDataSource {
    
    var viewController: HistoryViewController!
    
    var historyTransactions: [TransactionEntity] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        cell.showData(transaction: self.historyTransactions[indexPath.row])
        return cell
    }
}
