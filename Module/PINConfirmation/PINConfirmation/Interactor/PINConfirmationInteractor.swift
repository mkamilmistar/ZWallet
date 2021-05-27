//
//  PINConfirmationInteractor.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit

public protocol PINConfirmationInteractor {
    func postTransaction(pin: String, receiver: Int, amount: Int, notes: String)
}
