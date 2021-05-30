//
//  TransactionDetailsPresenterImpl.swift
//  TransactionDetails
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionDetailsPresenterImpl {
    var view: TransactionDetailsView
    var interactor: TransactionDetailsInteractor
    var router: TransactionDetailsRouter
    
    init(view: TransactionDetailsView, interactor: TransactionDetailsInteractor, router: TransactionDetailsRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension TransactionDetailsPresenterImpl: TransactionDetailsPresenter {
    func getBalance() {
        self.interactor.getBalance()
    }
    
    func navigateToHome() {
        self.router.navigateToHome()
    }
}

extension TransactionDetailsPresenterImpl: TransactionDetailsInteractorOutput {
    func getBalance(balance: Int) {
        self.view.getDataBalance(balance: balance)
    }
}
