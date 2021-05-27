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
    func navigateToTransaction()
}

class ReceiverDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewController: ReceiverViewController!
    var allDataReceiver: [ReceiverEntity] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDataReceiver.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReceiverCell.self), for: indexPath) as! ReceiverCell
        
        cell.showDataReceiver(receiver: self.allDataReceiver[indexPath.row])
        cell.delegate = self.viewController
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect row animation
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
}
