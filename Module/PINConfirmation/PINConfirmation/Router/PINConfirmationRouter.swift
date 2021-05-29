//
//  PINConfirmationRouter.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public protocol PINConfirmationRouter {
    func navigateToTransactionStatus(viewController: UIViewController, isSuccess: Bool, passDataTransaction: ReceiverEntity, amount: Int, notes: String)
    func backNavigation(viewController: UIViewController)
}
