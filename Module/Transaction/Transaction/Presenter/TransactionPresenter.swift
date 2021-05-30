//
//  TransactionPresenter.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public protocol TransactionPresenter {
    func navigateToDetailTransaction(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String)
    func backToReceiver(viewController: UIViewController)
    func backToHome(viewController: UIViewController)
    func getUserBalance()
}
