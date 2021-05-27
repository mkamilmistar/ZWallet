//
//  ReceiverPresenter.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public protocol ReceiverPresenter {
    func loadDataReceiver()
    func backToHome(viewController: UIViewController)
    func passingDataReceiver(viewController: UIViewController, passingData: ReceiverEntity)
}
