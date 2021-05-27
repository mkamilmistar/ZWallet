//
//  TransactionInteractor.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public protocol TransactionInteractor {
    func postTransaction(pin: String, receiver: Int, amount: Int, notes: String)
}
