//
//  TransactionView.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

protocol TransactionView {
    func showError()
    func getUserBalance(balance: Int)
}
