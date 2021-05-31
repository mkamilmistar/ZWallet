//
//  TransactionInteractorImpl.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

public class TransactionInteractorImpl: TransactionInteractor {
    
    var interactorOutput: TransactionInteractorOutput?
    let balanceNetworkManager: BalanceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
    }
    
    public func getBalance() {
        self.balanceNetworkManager.getBalance { (data, _) in
            if let dataBalance = data {
                self.interactorOutput?.getBalance(balance: dataBalance.balance)
            }
        }
    }
}
