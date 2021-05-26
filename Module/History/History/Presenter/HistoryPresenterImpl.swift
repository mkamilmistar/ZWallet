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
    
    func loadHistoryThisWeek() {
        self.interactor.getHistoryThisWeek()
    }
    
    func loadHistoryThisMonth() {
        self.interactor.getHistoryThisMonth()
    }
    
    func backToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedHistoryThisWeek(historiesThisWeek: [TransactionEntity]) {
        self.view.showHistoryThisWeek(historiesThisWeek: historiesThisWeek)
    }
    
    func loadedHistoryThisMonth(historiesThisMonth: [TransactionEntity]) {
        self.view.showHistoryThisMonth(historiesThisMonth: historiesThisMonth)
    }
}
