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
    
    var historyThisWeek: [TransactionEntity] = []
    var historyThisMonth: [TransactionEntity] = []
    var historyHeader = ["This Week", "This Month"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.historyThisWeek.count
        } else {
            return self.historyThisMonth.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return self.historyHeader[0]
        } else {
            return self.historyHeader[1]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return historyHeader.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.showData(transaction: self.historyThisWeek[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.showData(transaction: self.historyThisMonth[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
}
