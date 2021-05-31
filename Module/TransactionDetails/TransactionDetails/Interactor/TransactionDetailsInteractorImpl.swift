//
//  TransactionDetailsInteractorImpl.swift
//  TransactionDetails
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

public class TransactionDetailsInteractorImpl: TransactionDetailsInteractor {
    
    var interactorOutput: TransactionDetailsInteractorOutput?
    var networkManager: BalanceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager) {
        self.networkManager = balanceNetworkManager
    }
    
    func getBalance() {
        self.networkManager.getBalance { (data, _) in
            if let dataBalance = data {
                self.interactorOutput?.getBalance(balance: dataBalance.balance)
            }
        }
    }
}
