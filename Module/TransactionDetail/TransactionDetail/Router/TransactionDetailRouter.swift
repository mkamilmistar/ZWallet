//
//  TransactionDetailRouter.swift
//  TransactionDetail
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public protocol TransactionDetailRouter {
    func backToTransaction(viewController: UIViewController)
    func navigateToInputPIN(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String)
}
