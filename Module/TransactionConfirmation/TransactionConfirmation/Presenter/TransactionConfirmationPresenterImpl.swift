//
//  TransactionDetailPresenterImpl.swift
//  TransactionDetail
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

class TransactionConfirmationPresenterImpl: TransactionConfirmationPresenter {
    var view: TransactionConfirmationView
    var router: TransactionConfirmationRouter
    var interactor: TransactionConfirmationInteractor
    
    init(view: TransactionConfirmationView, interactor: TransactionConfirmationInteractor, router: TransactionConfirmationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func backToTransaction(viewController: UIViewController) {
        self.router.backToTransaction(viewController: viewController)
    }
    
    func navigateToCheckPIN(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        self.router.navigateToInputPIN(viewController: viewController, passDataTransaction: passDataTransaction, amount: amount, notes: notes)
    }
    
    func getUserBalance() {
        self.interactor.getBalance()
    }
}

extension TransactionConfirmationPresenterImpl: TransactionConfirmationInteractorOutput {
    func getBalance(balance: Int) {
        self.view.getDataBalance(balance: balance)
    }
}
