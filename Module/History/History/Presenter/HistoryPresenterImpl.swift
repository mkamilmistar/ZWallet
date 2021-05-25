//
//  HistoryPresenterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryPresenterImpl: HistoryPresenter {
    
    let view: HistoryView
    let interactor: HistoryInteractor
    let router: HistoryRouter
    
    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadHistoryTransaction() {
        self.interactor.getHistoryTransaction()
    }
    
    func backToHome() {
        self.router.navigateToHome()
    }
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedHistoryTransaction(histories: [TransactionEntity]) {
        self.view.showHistoryData(transactions: histories)
    }
}
