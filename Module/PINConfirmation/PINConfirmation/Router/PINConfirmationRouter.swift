//
//  PINConfirmationRouter.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit

public protocol PINConfirmationRouter {
    func navigateToTransactionStatus(viewController: UIViewController)
    func backNavigation(viewController: UIViewController)
}
