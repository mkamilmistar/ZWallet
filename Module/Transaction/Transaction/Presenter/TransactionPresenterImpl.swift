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
    var interactor: TransactionInteractor
    var router: TransactionRouter
    
    init(view: TransactionView, interactor: TransactionInteractor, router: TransactionRouter) {
        self.view = view
        self.interactor = interactor
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

extension TransactionPresenterImpl: TransactionInteractorOutput {
    func transactionResult(isSuccess: Bool) {
        if isSuccess {
            self.router.backToHome()
        } else {
            self.view.showError()
        }
    }
    
}
