//
//  PINConfirmationPresenter.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit

protocol PINConfirmationPresenter {
    func createTransaction(pin: String, receiver: Int, amount: Int, notes: String)
    func backNavigation(viewController: UIViewController)
}
