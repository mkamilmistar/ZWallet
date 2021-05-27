//
//  ReceiverCellDelegate.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public protocol ReceiverCellDelegate {
    func navigateToTransaction(id: Int, name: String, phone: String, image: String)
}
