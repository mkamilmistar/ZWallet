//
//  TransactionPresenter.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit

public protocol TransactionPresenter {
    func createTransaction(pin: String, receiver: Int, amount: Int, notes: String)
    func backToReceiver(viewController: UIViewController)
    func backToHome(viewController: UIViewController)
}
