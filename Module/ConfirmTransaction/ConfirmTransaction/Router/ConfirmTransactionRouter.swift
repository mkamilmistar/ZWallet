//
//  ConfirmTransactionRouter.swift
//  ConfirmTransaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

protocol ConfirmTransaction {
    func backToTransaction(viewController: UIViewController)
    func navigateToInputPIN(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String)
}
