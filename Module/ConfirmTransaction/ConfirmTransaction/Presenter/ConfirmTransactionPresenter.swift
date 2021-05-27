//
//  ConfirmTransactionPresenter.swift
//  ConfirmTransaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

protocol ConfirmTransactionPresenter {
    func navigateToCheckPIN(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String)
    func backToTransaction(viewController: UIViewController)
}
