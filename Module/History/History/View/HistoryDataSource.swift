//
//  HistoryDataSource.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewController: HistoryViewController!
    
    var historyThisWeek: [TransactionEntity] = []
    var historyThisMonth: [TransactionEntity] = []
    var sectionTitles = ["This Week", "This Month"]
    public lazy var filteredDataWeek = self.historyThisWeek
    public lazy var filteredDataMonth = self.historyThisMonth
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.filteredDataWeek.count
        } else {
            return self.filteredDataMonth.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9882352941, blue: 1, alpha: 1)
        
        let label = UILabel()
        label.text = sectionTitles[section]
        label.font = UIFont(name: "NunitoSans", size: 16)
        label.textColor = #colorLiteral(red: 0.4784313725, green: 0.4705882353, blue: 0.5254901961, alpha: 1)
        label.frame = CGRect(x: 16, y: 0, width: 100, height: 25)
        view.addSubview(label)
        
        return view
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.showData(transaction: self.filteredDataWeek[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.showData(transaction: filteredDataMonth[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
}
