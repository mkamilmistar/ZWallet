//
//  PINConfirmationInteractorImpl.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class PINConfirmationInteractorImpl: PINConfirmationInteractor {
    var interactorOutput: PINConfirmationInteractorOutput?
    let transactionNetworkManager: TransactionNetworkManager
    
    init(transactionNetworkManager: TransactionNetworkManager) {
        self.transactionNetworkManager = transactionNetworkManager
    }
    
    func postTransaction(pin: String, receiver: Int, amount: Int, notes: String) {
        self.transactionNetworkManager.createTransaction(
            receiver: receiver, amount: amount, notes: notes, pin: pin) { (data, error) in
            if data?.status == 200 {
                self.interactorOutput?.transactionResult(isSuccess: true)
            } else {
                self.interactorOutput?.transactionResult(isSuccess: false)
            }
        }
    }
    
}
