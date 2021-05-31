//
//  TopUpDataSource.swift
//  TopUp
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

class TopUpDataSource: NSObject, UITableViewDataSource {
    
    var viewController: TopUpViewController!
    
    var topUpData: [TopUpEntity] = topUp
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return topUpData.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as! HeaderViewCell
//            cell.delegate = self.viewController
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TopUpViewCell.self), for: indexPath) as! TopUpViewCell
            cell.showDataTopUp(topUpDesc: self.topUpData[indexPath.row])
//            cell.delegate = self.viewController
            cell.selectionStyle = .none
            return cell
        }
    }
    
}
