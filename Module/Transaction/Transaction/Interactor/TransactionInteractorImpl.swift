//
//  TransactionInteractorImpl.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

public class TransactionInteractorImpl: TransactionInteractor {
    
    var interacotOutput: TransactionInteractorOutput?
    let networkManager: TransactionNetworkManager
    
    init(networkManager: TransactionNetworkManager) {
        self.networkManager = networkManager
    }
    
    public func postTransaction(pin: String, receiver: Int, amount: Int, notes: String) {
        self.networkManager.createRegister(receiver: receiver, amount: amount, notes: notes, pin: pin) { (data, error) in
            if data?.status == 200 {
                self.interacotOutput?.transactionResult(isSuccess: true)
            } else {
                self.interacotOutput?.transactionResult(isSuccess: false)
            }
        }
    }
}
