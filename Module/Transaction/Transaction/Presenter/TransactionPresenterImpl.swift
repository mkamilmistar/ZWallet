//
//  TransactionPresenterImpl.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionPresenterImpl: TransactionPresenter {
    var view: TransactionView
    var router: TransactionRouter
    
    init(view: TransactionView, router: TransactionRouter) {
        self.view = view
        self.router = router
    }
    
    public func backToReceiver(viewController: UIViewController) {
        self.router.backToReceiver(viewController: viewController)
    }
    
    public func backToHome(viewController: UIViewController) {
        self.router.backToHome()
    }
    
    public func navigateToDetailTransaction(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        self.router.navigateToDetailTransaction(viewController: viewController, passDataTransaction: passDataTransaction, amount: amount, notes: notes)
    }
}
