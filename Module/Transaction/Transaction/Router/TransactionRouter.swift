//
//  TransactionRouter.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit

public protocol TransactionRouter {
    func navigateToDetailTransaction(viewController: UIViewController)
    func backToReceiver(viewController: UIViewController)
    func backToHome()
}
