//
//  TransactioinNetworkManager.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public protocol TransactionNetworkManager {
    func createTransaction(receiver: Int, amount: Int, notes: String, pin: String, completion: @escaping (TransactionResponse?, Error?) -> ())
}
