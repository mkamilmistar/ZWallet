//
//  TransactionDetailsRouter.swift
//  TransactionDetails
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit

public protocol TransactionDetailsRouter {
    func navigateToHome()
    func navigateToTransactionConfirmation(viewController: UIViewController)
}
