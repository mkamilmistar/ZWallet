//
//  TransactionConfirmationInteractorImpl.swift
//  TransactionConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

public class TransactionConfirmationInteractorImpl: TransactionConfirmationInteractor {
    
    var interactorOutput: TransactionConfirmationInteractorOutput?
    let balanceNetworkManager: BalanceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
    }
    
    func getBalance() {
        self.balanceNetworkManager.getBalance { (data, _) in
            if let dataBalance = data {
                self.interactorOutput?.getBalance(balance: dataBalance.balance)
            }
        }
    }
}
