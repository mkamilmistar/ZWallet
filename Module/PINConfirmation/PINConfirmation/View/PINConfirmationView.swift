//
//  PINConfirmationView.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

public protocol PINConfirmationView {
    func showError()
    func showTransactionDetails(isSuccess: Bool)
}
