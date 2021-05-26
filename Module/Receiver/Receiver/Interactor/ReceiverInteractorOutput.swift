//
//  ReceiverInteractorOutput.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

public protocol ReceiverInteractorOutput {
    func loadedDataReceiver(contacts: [ReceiverEntity])
}
