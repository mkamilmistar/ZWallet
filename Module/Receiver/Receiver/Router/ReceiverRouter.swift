//
//  ReceiverRouter.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public protocol ReceiverRouter {
    func navigateToHome(viewController: UIViewController)
    func navigateToTransaction(viewController: UIViewController, passingData: ReceiverEntity)
}
