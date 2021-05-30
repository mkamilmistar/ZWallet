//
//  TransactionPresenterImpl.swift
//  Transaction
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

class TransactionPresenterImpl: TransactionPresenter {
 
    var interactor: TransactionInteractor
    var view: TransactionView
    var router: TransactionRouter
    
    init(view: TransactionView, interactor: TransactionInteractor, router: TransactionRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func backToReceiver(viewController: UIViewController) {
        self.router.backToReceiver(viewController: viewController)
    }
    
    func backToHome(viewController: UIViewController) {
        self.router.backToHome()
    }
    
    func navigateToDetailTransaction(viewController: UIViewController, passDataTransaction: ReceiverEntity, amount: Int, notes: String) {
        self.router.navigateToDetailTransaction(viewController: viewController, passDataTransaction: passDataTransaction, amount: amount, notes: notes)
    }
    
    func getUserBalance() {
        self.interactor.getBalance()
    }
}

extension TransactionPresenterImpl: TransactionInteractorOutput {
    func getBalance(balance: Int) {
        self.view.getUserBalance(balance: balance)
    }
}
